class Pattern
  attr_accessor :pattern_name, :flat, :origin
  
  def initialize(pattern_name, pattern_origin, flat = true)
    
    if pattern_name.empty? 
      puts "You should specify base name for pattern"
      return
    end
    
    @pattern_name = pattern_name
    @flat = flat
    @origin = "#{PATTERNIZE_ROOT}/templates/#{pattern_origin}"
    
    self.create_folder_structure if flat
  end

  def process
    
    Dir.glob("#{origin}/**/*.[hm]").each do |f|

      new_file_name = "./" + f.sub(/.*\/(.*\.[hm])$/, '\1').sub('@pattern_name',@pattern_name)
      template = ERB.new(File.read(f)).result(binding)           
      File.open(new_file_name, "w+") { |file| file.write(template) }

    end
  end
  
  def create_folder_structure
    # Dir.glob('./work/personal_projects/learning_ruby/patternize/templates/folder/**/*').select {|f| File.directory? f}.each {|f| puts f}
    # puts "creating folder structure"
  end
end