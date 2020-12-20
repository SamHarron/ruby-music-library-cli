class Song

    attr_accessor :name, :artist, :genre

        #Class Variable, property of the class
    #itself set to an empty array.

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    # invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
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
    
    def self.find_by_name(name)
        all.detect { |a| a.name == name}
    end

    # returns (does not recreate) an existing song with the provided name if one exists in @@all 
    # invokes .find_by_name instead of re-coding the same functionality
    # creates a song if an existing match is not found
    # invokes .create instead of re-coding the same functionality

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    #    initializes a song based on the passed-in filename
    #    invokes the appropriate Findable methods so as to avoid duplicating objects

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
    
        new(song_name, artist, genre)
    end


    # initializes and saves a song based on the passed-in filename
    # invokes .new_from_filename instead of re-coding the same functionality
    
    def self.create_from_filename(filename)
        new_from_filename(filename).tap{ |s| s.save }
    end



    
end