class Templatizer < Thor
  include Thor::Actions
  
  attr_accessor :project_name, :pattern_to_replace

  no_tasks {

    def initialize(project_name = "TemplateProject")
      @project_name = project_name
      @pattern_to_replace = '@project_name'
    end
  
    def create_project
      
      system "git clone https://github.com/SlavkoKrucaj/TemplateProject " + @project_name
      system "rm -rf ./" + @project_name + "/.git"
      
      Dir.glob("./" + @project_name + "/**/*").reverse.select {|p| p.include? @pattern_to_replace}.each do |path|
             
         old_path = File.dirname(path)
         new_path = old_path + '/' + File.basename(path).gsub(@pattern_to_replace, @project_name)

         File.rename(path, new_path)    
         
         if !File.directory? new_path
           template = ERB.new(File.read(new_path)).result(binding)           
           File.open(new_path, "w+") { |file| file.write(template) }
        end
      end
    
      # Dir.glob("./**/*").select {|f| !File.directory? f}.each do |f|
      # 
      #   new_file_name = f.gsub('@project_name', @project_name)
      #   
      #   FileUtils.mkdir_p(File.dirname(new_file_name))
      # 

      # 
      # end    
    end
  }
  
end