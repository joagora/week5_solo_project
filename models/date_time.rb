require('date')
require('chronic')

class DateTime
  def initialize
  end

  def parse(string)
    string.Chronic.parse
  end

  def time_now
    return Time.now
  end
  
end
