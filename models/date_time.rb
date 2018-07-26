require('date')
require('chronic')

class FindDate
  def initialize
  end

  def parse(string)
    string.Chronic.parse
  end

  def time_now
    return Time.now
  end

  def self.day_of_week(string_date)
    return DateTime.parse(string_date).strftime("%A")
  end
end
