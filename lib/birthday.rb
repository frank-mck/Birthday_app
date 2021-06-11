 require 'date'

 class Birthday 
   attr_reader :name, :day, :date

   def initialize(name, day)
    @name = name
    @day = day
    @date = Date.parse(@day)
   end

   def is_it_my_birthday
     if max == min
      birthday_message
     else
      days_til_birthday
     end
   end

   def days_left
    max.to_i - min.to_i
   end

   private

   def birthday_message
    "Happy Birthday #{@name}!"
   end

   def days_til_birthday
    "Your Birthday will be in #{days_left} day#{days_left > 1 ? 's' : ''}, #{@name}."
   end

   def my_birthday_day
    @date.strftime "%j"
   end

   def min
    [my_birthday_day, current_day_of_year].min
   end

   def max 
    [my_birthday_day, current_day_of_year].max
   end

   def current_day_of_year
    DateTime.now.strftime "%j"
   end
  end