class Artist 
    extend Concerns::Findable

    @@all = [] 
    attr_accessor :name
    attr_reader :songs
    
    def initialize(name, artist=nil)
        @name = name 
        @songs = []
    end 
    
    def self.all 
        @@all
    end 

    def self.destroy_all
        self.all.clear 
    end 

    def save 
        @@all << self 
    end 
    
    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist 
    end 

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end

    def genres 
        songs.collect { |song| song.genre}.uniq
    end 
end 