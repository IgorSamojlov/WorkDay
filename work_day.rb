module WorkDay
  require 'date'
  require 'csv'

  class WorkCalendarDay
    attr_accessor :year, :table, :month

    def initialize (calendar)
      load_calendar calendar
    end

    def type(date=Date.new.today)
      prepere_year date
      return :day_off if @month.include? date.day.to_s
      return :half_day if @month.include? date.day.to_s << '*'
      :work_day
    end

    def week_day(date=Date.new.today)
      prepere_year date

    end

    def day_off(date=Date.new.today)
    end

    def count(from_date, to_date)
    end

    private

    def prepere_year(current_date)
      @table.each { |year| @year = year if current_date.year.to_s == year[0] }
      @year = @year[1..12].map { |month| month.lines(',', chomp: true) }
      @month = @year[current_date.month.to_i - 1]
    end

    def load_calendar(calendar)
      # для проверки на ошибки
      @table = CSV.read(calendar)
    end
  end
end
