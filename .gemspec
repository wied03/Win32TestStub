$LOAD_PATH << './lib'
require 'rake'

src="lib"
testdir="spec"

Gem::Specification.new do |s|
  s.name = "windows-pr"
  s.files = FileList["#{src}/**/*.rb",
                     "#{testdir}/**/*.rb"]
  s.test_files = FileList["#{testdir}/**/*.rb"]
  s.version = "1.0.2"
  s.summary = "A Win32 stub to allow windows registry using utilities"
  s.description = s.summary      
  s.has_rdoc = true
  s.rdoc_options << '--inline-source' << '--line-numbers'
  s.author = "Brady Wied"
  s.email = "brady@bswtechconsulting.com"        
end
