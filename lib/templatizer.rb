class Templatizer < Thor
  include Thor::Actions
  
  attr_accessor :project_name, :pattern_to_replace, :github_repo

  no_tasks {

    def initialize(project_name = "TemplateProject", github_repo = "")
      @project_name = project_name
      @github_repo = github_repo
      @pattern_to_replace = '@project_name'
    end
  
    def create_project
      
      system "git clone https://github.com/SlavkoKrucaj/TemplateProject " + @project_name
      
      Dir.glob("./" + @project_name + "/**/*").reverse.select {|p| p.include? @pattern_to_replace}.each do |path|
             
         old_path = File.dirname(path)
         new_path = old_path + '/' + File.basename(path).gsub(@pattern_to_replace, @project_name)

         File.rename(path, new_path)    
         
         if !File.directory? new_path
           template = ERB.new(File.read(new_path)).result(binding)           
           File.open(new_path, "w+") { |file| file.write(template) }
        end
      end
      
      say "Pushing to GitHub repo == #{@github_repo}"
      
      if (@github_repo.empty?)
        system "rm -rf ./" + @project_name + "/.git"
      else
        Dir.chdir @project_name
        system "pwd"
        system "git remote set-url origin " + @github_repo
        system "git add -A ."
        system 'git commit -m "Initial commit"'
        system 'git push origin master'
        Dir.chdir ".."
      end
  
    end
  }
  
end