require "date"



def days_till_christmas(year, month, day)
  christmas = Time.new(Time.now.year, 12, 24)
  today = Time.now
  days = (christmas - today) / 86400
  puts days.floor
  # TODO: return the age expressed in days given the day, month, and year of birth
end

days_till_christmas(2017, 07, 11)
