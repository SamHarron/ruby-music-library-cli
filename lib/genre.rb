class Genre
    extend Concerns::Findable
    
    attr_accessor :name, :songs

        #Class Variable, property of the class
    #itself set to an empty array.

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
    
    def artists
        songs.collect{ |y| y.artist }.uniq
    end
end