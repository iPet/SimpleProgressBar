# the SimpleProgressBar class
class SimpleProgressBar
  VERSION = "0.1.2"
    # Constructor
    def initialize(max = 100.0)
      self.max  ||= max   #will set the default value only if it's nil
      self.current ||= 0.0 
      self.percentage ||= 0.0
      self.start_time = nil
      self.previous_time = nil
    end

    attr_accessor :max, :current, :percentage, :start_time, :previous_time
    
    # The set_max function sets the new maximum value of the progress bar
    # This value should be greater than 0
    #
    # * *Arguments*    :
    #   - max ->  value should be greater 0, will be parsed to float
    def set_max(max)
      self.max = (max > 0 ? max : 1)
    end

    # The increment function adds to the current progress value
    # The current progress, can't go higher than the maximum
    #
    # * *Arguments*    :
    #   - amount ->  value which will be added to the current progress
    def increment(amount = 1)
       self.start_time ||= Time.now
       self.current = (self.current + amount < self.max ? self.current + amount : self.max)
       self.previous_time ||= Time.now
       calc_percent
    end

    # The time_to_finish method calculates the secondes needed to finish
    # based on the average time between increments
    def time_to_finish
      past_time = Time.now - self.start_time
      seconds_to_go = past_time * self.max / self.current - past_time
      puts "time to go: #{seconds_to_go.round}s"
    end

    # Inspect function to show the object and the current/max for easy debugging
    def inspect
      "#<SimpleProgressBar:#{self.current}/#{self.max}>"
    end

    private

    # The percent function calculates the percentage
    # This method is called before every update, so it will be up to date
    def calc_percent
       self.percentage = (self.current <= self.max ? self.current/self.max*100 : self.max)
    end
end
