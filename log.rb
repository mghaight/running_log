class Run

    attr_reader :distance, :time, :notes, :date

    def initialize( distance, time = nil, notes = nil )
        raise TypeError, "Distance must be a Float." unless distance.is_a? Float
        @distance = distance
        if time.is_a? Float
            time_arr = time.divmod 1
            @time = time_arr[0].to_s << ":" << (time_arr[1] * 60).round.to_s
        end
        @notes = notes if notes.is_a? String
        @date = Time.now
    end

    def edit_distance( new_distance )
        raise TypeError, "Distance must be a Float." unless new_distance.is_a? Float
        @distance = new_distance
    end

    def edit_time( new_time )
        raise TypeError, "Time must be a Float." unless new_time.is_a? Float
        time_arr = new_time.divmod 1
        @time = time_arr[0].to_s << ":" << (time_arr[1] * 60).round.to_s
    end

    def edit_notes( new_notes )
        raise TypeError, "Notes must be a String." unless new_notes.is_a? String
        @notes = new_notes
    end

    def append_notes( add_notes )
        raise TypeError, "Notes must be a String." unless new_notes.is_a? String
        @notes << add_notes
    end

    def edit_date( *args )
        raise ArgumentError, "A Date must have a year, month and day." unless args.length === 3
        raise TypeError, "Year, month and day must be integers." unless args.each{ |i| i.is_a? Integer }
        @date = Time.new( args[0], args[1], args[2] )
    end

    def to_s
       puts( "Date: " << @date.asctime << "    Distance: " << @distance.to_s << " mi    Time: " << @time.to_s << "    Notes: " << @notes.to_s )
    end

end

class Week

    def initialize
        @week = [nil] * 7
    end

    def add_run( run, day )
        raise TypeError, "A run must a be a Run object, not a math problem or a list of names or any of that business." unless run.instance_of? Run
        @week[day] = run
    end

    def to_s
        puts "Week of " << @week[0].date.asctime.to_s unless @week[0].nil?
        puts "-" * 35
        @week.each{ |i| i.to_s}
    end

end

class Log

    def initialize
        @file = File.new( "log.txt", "w+" )
    end

    def read
        @file.each_line{ |line| line.to_s }
    end

    def write( week )
        raise TypeError, "You must write a week at a time!" unless week.is_a? Week
        @file.write week
    end

end





new_run0 = Run.new( 8.0, 59.75, "Felt pretty good for my first day back." )
new_run0.edit_date( 2015, 9, 21 )
new_run1 = Run.new(5.0, 35.5, "OK. Was a little sore.")

new_week = Week.new
new_week.add_run( new_run0, 0 )
new_week.add_run( new_run1, 2 )

new_log = Log.new
new_log.write( new_week )
