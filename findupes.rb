#!/usr/bin/env ruby

# puts Digest::MD5.hexdigest("test")
# puts Digest::MD5.hexdigest(File.read($0))

class DuplicateFinder

  require "digest/md5"
  attr_accessor :filenames

  # input: array of file and / or directory paths
  def initialize inputs=[]
    self.filenames = []
    inputs.each do |input|
      if Dir.exist? input
        Dir["#{input}/**/*"].each do |filename|
          self.filenames << filename unless File.directory?(filename) || File.symlink?(filename)
        end
      elsif File.exist? input
        self.filenames << input
      else
        puts "invalid input: #{input}"
      end
    end
  end

  # process the filenames array: computing their hex values, detecting duplicates
  def detect
    hexes = {}
    puts "scanning #{filenames.size} files..."
    self.filenames.each do |filename|
      hex = Digest::MD5.hexdigest(File.read(filename))
      hexes[hex] = [] unless hexes.has_key?(hex)
      hexes[hex] << filename
    end

    hexes.each do |hex, files|
      if files.size > 1
        puts "\nduplicates found @ #{hex}:"
        files.each{ |file| puts "\t#{file}" }
      end
    end
    puts "scanned #{filenames.size} files"
  end

end

df = DuplicateFinder.new ARGV
df.detect
