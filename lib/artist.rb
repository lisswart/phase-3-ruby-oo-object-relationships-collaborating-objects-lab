class Artist
    @@all = []
    attr_accessor :name, :songs   

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def add_song(song)  ## this method is associated with the Song class, in particular, Song#artist= and Song#artist
        song.artist = self
    end

    def songs  ## this method is associated with the Song class, in particular, Song#artist= and Song#artist
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name} 
    end

    def save
        @@all << self
    end

    def print_songs  ## this method lists all the artist's songs, 
        #hence is associated with the Song class, 
        #in particular, Song#artist= and Song#artist
        songs.each {|song| puts song.name}
    end

end