class Templatizer
  
  attr_accessor :project_name, :pattern_to_replace, :options, :original_commit
  
  def initialize(project_name = "TemplateProject", options)
    @project_name = project_name
    @options = options
    @pattern_to_replace = '@project_name'
    @original_commit = "22d1090eeb8824370d5e6d38e6c7b7708e150500"
  end

  def create_project
    
    system "git clone https://github.com/SlavkoKrucaj/TemplateProject " + @project_name
    
    Dir.chdir @project_name
    if @options[:pod].nil?
      commit = (@options[:commit] && !@options[:commit].empty?)? options[:commit] : "1.0"
      system "git reset --hard #{commit}"
    end
 
    system "rm -rf .git"

    Dir.glob("./**/*").reverse.select {|p| p.include? @pattern_to_replace}.each do |path|
           
       old_path = File.dirname(path)
       new_path = old_path + '/' + File.basename(path).gsub(@pattern_to_replace, @project_name)

       File.rename(path, new_path)    
       
       if !File.directory? new_path
         template = ERB.new(File.read(new_path)).result(binding)           
         File.open(new_path, "w+") { |file| file.write(template) }
      end
    end
    
    if !@options[:pod].nil? 
      if @options[:pod] != "pod"
        self.merge_files @options[:pod], "./Podfile"
      end
      system "pod install"
    end
    
    
    if @options[:repo] && !@options[:repo].empty?
      system "git init"
      system "cp " + PATTERNIZE_ROOT + "/templates/gitignore ./.gitignore"
      system "git add -A ."
      system 'git commit -m "Initial commit"'
      system "git remote add origin " + @options[:repo]
      system 'git push -u origin master'
    end

    Dir.chdir ".."

  end
  
  def merge_files(from_file, to_file)
    #in future it should merge pod files
    system "cp ../" + from_file + " " + to_file 
  end
  
end