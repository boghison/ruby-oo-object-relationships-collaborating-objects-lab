class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end

    def files
        Dir.new(@path).reject { |f| File.directory? f || f.extname != ".mp3" }
    end
    
    def import 
        puts self.files
        self.files.each do |file| 
            Song.new_by_filename(File.basename(file))
        end
    end
end
