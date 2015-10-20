#!/usr/bin/env ruby

require_relative "log"

class CommandLineInterface

  def initialize
    @log = Log.load ARGV[0], ARGV[1]
  end

  def log_new
    @log.log_new "log.yaml", "log.txt"
  end

  def totals
    Log.totals "log.yaml", ARGV[2]
  end

end

cli = CommandLineInterface.new
cli.log_new

cli.totals
