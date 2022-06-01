class Song
    attr_accessor :artist, :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      save
    end
  
    def save
      @@all << self
    end
  
    def self.all
      @@all
    end

    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        artist = parts[0]
        name = parts[1]
        song = Song.new(name)
        song.artist_name = artist
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
  end 