$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

include_files = ["Readme.md", "Gemfile", "Gemfile.lock", "{bin,lib,templates}/**/*"].map do |glob|
  Dir[glob]
end.flatten

Gem::Specification.new do |s|
  s.name    = 'patternize'
  s.version = '0.0.1'
  
  s.summary = "Create pattern skeletons with ease and also create project from template iOS project"
  s.description = "Create pattern skeletons with ease and also create project from template iOS project"
  
  s.authors  = ['Slavko Krucaj']
  s.email    = ['slavko.krucaj@gmail.com']
  s.homepage = 'http://github.com/SlavkoKrucaj/patternize'
  s.platform = Gem::Platform::RUBY
  
  s.executables = 'patternize'
  
  s.has_rdoc = true
  s.rdoc_options = ['--main', 'Readme.md']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['Readme.md']
  
  s.require_paths = ["lib"] 
  s.files = include_files 
end