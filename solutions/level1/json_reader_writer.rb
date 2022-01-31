require 'json'

class JsonReaderWriter
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def read_file(json_file)
    if json_file.include?('.json')
      file = File.read(json_file)
      JSON.parse(file)
    else
      puts "Bad file type."
      nil
    end
  end

  def export_to_file(export_data)
    File.open("output.json", "w") do |f|
      f.write(JSON.pretty_generate(export_data))
    end
  end
end
