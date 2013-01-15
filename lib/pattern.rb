class Pattern
  attr_accessor :pattern_name, :flat, :origin
  attr_accessor :project_name, :author, :company
  
  def initialize(pattern_name, pattern_origin, flat = true)
    
    if pattern_name.empty? 
      puts "You should specify base name for pattern"
      return
    end
    
    @pattern_name = pattern_name
    @flat = flat
    @origin = "#{PATTERNIZE_ROOT}/templates/#{pattern_origin}"
    
    options_file = File.read "#{Dir.home}/.patternize"
    if options_file
      options = YAML::load( options_file )

      @project_name = options[:project]
      @author = options[:author]
      @company = options[:company]
    else
      @project_name = "Project"
      @author = "Author"
      @company = "Company"
    end
  end

  def process
    
    Dir.glob("#{origin}/**/*.[hm]").each do |f|

      new_file_name = "./" + f.sub(/.*\/(.*\.[hm])$/, '\1').sub('@pattern_name',@pattern_name)
      template = ERB.new(File.read(f)).result(binding)           
      File.open(new_file_name, "w+") { |file| file.write(template) }

    end
  end

end