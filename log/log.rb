require_relative "run"

class Log

  def self.load ( dist )
    log = Log.new
    log.add ( dist )
    log
  end

  def initialize
    @log = []
  end

  def add ( distance )
    @log << ( Run.new ( distance ) )
  end

  def write ( file )
    f = File.new file, "a"
    @log.each { |run| f.puts run }
    f.close
  end

end
