class Patternize < Thor
  include Thor::Actions
  attr_accessor :project_name
  
  desc 'create [PATTERN] [NAME]','create [PATTERN] with base [NAME]'
  def create pattern = "", name = ""
    supported_patterns = ['singleton', 'prototype', 'factory_method']

    if !supported_patterns.include? pattern 
      say "Pattern is not supported, try with one of #{supported_patterns}"
      return
    end
    
    p = Pattern.new(name,pattern).process
    
    say "Skeleton for #{pattern} has been created."
    
  end
  
  desc 'start [PROJECT_NAME]', 'create project from template'
  method_option :repo
  method_option :pod
  method_option :commit
  def start project_name = ""
    
    Templatizer.new(project_name,options).create_project
    
    if options[:pod]
      system "open ./#{project_name}/#{project_name}.xcworkspace"
    else
      system "open ./#{project_name}/#{project_name}.xcodeproj"
    end

  end
  
  desc 'config', 'create config file'
  method_option :author
  method_option :company
  method_option :project
  def config
    
    settings_file = File.read "#{Dir.home}/.patternize"
    
    if settings_file
      settings = YAML::load( settings_file )
      settings[:author] = options[:author] if options[:author]
      settings[:company] = options[:company] if options[:company] 
      settings[:project] = options[:project] if options[:project]
      
    end
    
    File.open(Dir.home + "/.patternize", 'w') { |file| file.write settings.to_yaml }    
    
  end

end