class Run

  attr_accessor :distance, :date

  def initialize ( distance )
    @distance = distance.chomp
    @date = Time.now.strftime ( "%a %b %d %Y" )
  end

  def to_s
    "Date: " << @date.to_s << "    Distance: " << @distance.to_s << " mi"
  end

end
