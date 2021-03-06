require_relative "run"
require "yaml"

class Log

  def self.load dist, notes
    log = Log.new
    log.add dist, notes
    log
  end

  def initialize
    @log = []
  end

  def add distance, notes
    @log << ( Run.new distance, notes )
  end

  def self.serialize file, arg
   File.open file, "w+" do |file|
      yaml = YAML::dump arg
      file.write yaml
    end
  end

  def self.deserialize file
    f = File.new file, "r+"
    yaml = YAML::load f
    f.close
    yaml
  end

  def log_new yfile, tfile
    yaml = Log.deserialize yfile
    yaml = [] unless yaml
    yaml << @log[0]
    Log.serialize yfile, yaml
    File.open tfile, "w+" do |f|
      yaml.each { |run| f.puts run.to_s }
    end
  end

  def self.totals yfile, arg
    total = 0
    yaml = Log.deserialize yfile

    if arg === "w"
      arg = 7
      dur = "weekly"
    elsif arg === "a"
      arg = yaml.length
      dur = "overall"
    else
      return false
    end

    arg.times { |i| total += yaml[-i].distance.to_i }
    
    puts "Total #{dur} distance: #{total} miles"
  end

end
