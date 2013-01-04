class Patternize < Thor
  include Thor::Actions
  attr_accessor :project_name
  
  desc 'create [PATTERN] [NAME]','create [PATTERN] with base [NAME]'
  def create(pattern = "", name = "")
    supported_patterns = ['singleton', 'prototype', 'factory_method']

    if !supported_patterns.include?(pattern) 
      say "Pattern is not supported, try with one of #{supported_patterns}"
      return
    end
    
    p = Pattern.new(name,pattern).process
    
    say "Skeleton for #{pattern} has been created."
    
  end
  
  desc 'start [PROJECT_NAME]', 'create project from template'
  method_option :repo
  def start(project_name = "")
    
    Templatizer.new(project_name, options[:repo]).create_project
    system "open ./#{project_name}/#{project_name}.xcodeproj"

  end

end