class MusicImporter

      # initialize
      # accepts a file path to parse MP3 files from
      # path
      # retrieves the path provided to the MusicImporter object

    attr_accessor :path

    def initialize(path)
        @path = path
    end

      # files
      # loads all the MP3 files in the path directory
      # normalizes the filename to just the MP3 filename with no path

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

#     imports the files into the library by invoking Song.create_from_filename
    def import
        files.each do |c| 
            Song.create_from_filename(c) 
        end
    end
end