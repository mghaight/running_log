require_relative "run"

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

  def write file
    f = File.new file, "a"
    @log.each { |run| f.puts run }
    f.close
  end

end
