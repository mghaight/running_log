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

  # def write file
  # end

  # def read rfile, ofile
  # end

  # def log_new rfile, ofile
  #   f = File.new rfile, "w+"
  #   o = File.new ofile, "w+"
  #   yaml_log = YAML::load f
  #   p yaml_log
  #   p @log
  #   # yaml_log.concat @log
  #   # yaml_log.each { |run| o.puts run }
  #   # o.close
  #   # dump = YAML::dump yaml_log
  #   # f.write dump
  #   # f.close
  # end

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

end
