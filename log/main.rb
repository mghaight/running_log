#!/usr/bin/env ruby

require_relative "log"

class CommandLineInterface

  def initialize
    @log = Log.load ARGV[0], ARGV[1]
  end

  def write
    @log.write "log.txt"
  end

end

cli = CommandLineInterface.new
cli.write
