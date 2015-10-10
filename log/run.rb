class Run

  attr_accessor :distance, :notes, :date

  def initialize distance, notes = nil
    @distance = distance.chomp
    @notes = notes
    @date = Time.now
  end

  def to_s
    "Date: #{@date.strftime "%a %b %d %Y"}    Distance: #{@distance.to_s} mi    Notes: #{@notes.to_s}"
  end

end
