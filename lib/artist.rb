class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs

        #Class Variable, property of the class
    #itself set to an empty array.

    @@all = []

    def initialize(name)
        @name = name
        @songs = [] #Creates a songs property set to an empty array **artists HAVE MANY songs
    end

    def self.all #Class Reader, exposing the value it the below variable
        @@all
    end

    def save
        @@all << self #whenever you create a new object it will save itself into the Class Variable @@all. Instance Method
    end

    def self.destroy_all #Helper method, uses the .clear method to erase the array. Class Method
        @@all.clear
    end

    def self.count #Class Method .count, that returns the size of the Class Variable @@all
        @@all.size
    end

    def self.create(name) #Class Method .create,  that initializes and saves the artist to the class variable array.
        artist = new(name)
        artist.save
        artist
    end

    # add_song method
    # assigns the current artist to the 
    # song's 'artist' property 
    # (song belongs to artist) does not add
    # the song to the current artist's 
    # collection of songs if it already 
    # exists therein

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end
    
# artists
# returns a collection of artists for all of the genre's songs (genre has many artists through songs) 
# does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs) 
# collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)

    def genres
        songs.collect{ |x| x.genre }.uniq
    end

end