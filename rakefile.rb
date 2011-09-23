require 'rake'
require 'rubygems'
require 'rubygems/package_task'
require 'rspec/core/rake_task'

def with(value)
  yield(value)
end

task :ci => :spec

with("spec") do |testdir|
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = FileList["#{testdir}/**/*_spec.rb"]
  end

  task :clean_install => [:repackage, :install]

  with("win32stub") do |gemname|
    task :install do
      sh "gem install #{FileList['pkg/*.gem'].first()}"
      sh "gem cleanup #{gemname}"
    end

    with ("lib") do |src|
      spec = Gem::Specification.new do |s|
        s.name = gemname
        s.files = FileList["#{src}/**/*.rb",
                           "#{testdir}/**/*.rb"]
        s.test_files = FileList["#{testdir}/**/*.rb"]
        s.version = "1.0.1"
        s.summary = "A Win32 stub to allow windows registry using utiliti"
        s.description = s.summary
        s.has_rdoc = true
        s.rdoc_options << '--inline-source' << '--line-numbers'
        s.author = "Brady Wied"
        s.email = "brady@wied.us"
      end

      Gem::PackageTask.new(spec) do |pkg|
      end
    end
  end
end