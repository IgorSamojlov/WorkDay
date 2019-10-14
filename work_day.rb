module WorkDay
  require 'date'
  require 'csv'

  class WorkCalendarDay
    attr_accessor :year, :table, :month

    def initialize (calendar)
      @table = {}
      table = CSV.read(calendar)
      parse_calendar table
    end

    def type(date=Date.new.today)
      @table.has_key?(date.year) ? month = @table[date.year][date.month] : (return false)
      if month.include?(date.day.to_s)
        return :day_off
      elsif month.include?(date.day.to_s << '*')
        return :half_day
      else
        return :work_day
      end
    end

    def week_day(date=Date.new.today)
      month = @table[date.year][date.month].map do |d|
        d.delete '*' if d.include? '*'
        return false if d == date.day.to_s
        d.to_i
      end
      (Array(1..date.day) - month).count - 1
    end

    def day_off(date=Date.new.today)
      month = @table[date.year][date.month]
      if !month.include? date.day.to_s || month.include?(date.day.to_s << '*')
        return false
      else
        month.delete_if { |d| d.include? '*' }
        return month.index date.day.to_s
      end
    end

    private

    def parse_calendar(table)
      table.delete_at(0)
      table.each do |year|
        @table[year[0].to_i] = year[1..12].map { |month| month.lines(',', chomp: true) }.insert(0, nil)
      end
    end
  end
end
