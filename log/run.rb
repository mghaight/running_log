class Run

  attr_accessor :distance, :notes, :date

  def initialize distance, notes = nil
    @distance = distance.chomp
    @notes = notes
    @date = Time.now.strftime "%a %b %d %Y"
  end

  def to_s
    "Date: #{@date.to_s}    Distance: #{@distance.to_s} mi    Notes: #{@notes.to_s}"
  end

end
