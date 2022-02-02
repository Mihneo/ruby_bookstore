require_relative 'json_reader_writer'

class Printer
  def self.export_receipt(json)
    JsonReaderWriter.export_to_file(json)
  end
end
