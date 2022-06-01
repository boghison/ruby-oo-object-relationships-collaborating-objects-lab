class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

    def self.find_or_create_by_name(name)
        artist = @@all.detect {|artist| artist.name == name}
        return artist == nil ? Artist.new(name) : artist
    end

end