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
end