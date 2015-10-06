require_relative "log"

class CommandLineInterface

  def initialize
    @log = Log.load ( ARGV[0] )
  end

  def write
    @log.write ( "log.txt" )
  end

end

cli = CommandLineInterface.new
cli.write
