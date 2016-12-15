# A utility class for things that might be useful in more than one place.
# Made by us (not part of Rails)

require 'active_support/core_ext'

class RideShareUtil
    @@date_regex = /(?<month>\d{1,2})\/(?<day>\d{1,2})\/(?<year>\d{4})/
    @@time_regex = /(?<hour>\d{1,2}):(?<min>\d{2}) (?<am_pm>am|pm)/i
    
    def self.date_regex
        return @@date_regex
    end
    
    def self.time_regex
        return @@time_regex
    end
    
    def self.valid_date? (date_str)
        date_match = @@date_regex.match date_str
        if not date_match
            return :invalid_format, "Improper date format! Format should be MM/DD/YYYY."
        elsif date_match['month'].to_i <= 0 or date_match['month'].to_i > 12
            return :invalid_month,  "Improper date format! There is no month ##{date_match['month']}!"
        elsif date_match['day'].to_i <= 0 or date_match['day'].to_i > 31
            return :invalid_day, "Improper date format! There is no day ##{date_match['day']}!"
        end
        
        # Even if we made it here, the date may still not be
        # valid. So, we check by attempting to create a Date
        # object.
        begin
            d = Date.new(date_match['year'].to_i, date_match['month'].to_i, date_match['day'].to_i)
        rescue ArgumentError
            return :invalid, "Improper date format!"
        end
        
        #if we made it here, it's a valid date!
        return :valid, "Success!"
    end
    
    def self.valid_time? (time_str)
        time_match = @@time_regex.match time_str
        if not time_match
            return :invalid_format, "Improper time format! Format should be HH:MM AM."
        elsif time_match['hour'].to_i <= 0 or time_match['hour'].to_i > 12
            return :invalid_hour, "Improper time format! There is no #{time_match['hour']} o'clock!"
        elsif time_match['min'].to_i < 0 or time_match['min'].to_i >= 60
            return :invalid_min, "Improper time format! You can't have #{time_match['min']} as a minute value!"
        end
        
        # If we're here, we're good!
        return :valid, "Success!"
    end
    
end
