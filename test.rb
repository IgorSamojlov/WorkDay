require './work_day.rb'

RSpec.describe 'test WorkDay' do
  let(:wd) { WorkDay::WorkCalendarDay.new 'data.csv' }

  it 'week_day, если выходной' do
    expect(wd.week_day(Date.new(2019, 10, 7))).to eq(false)
  end

  it 'week_day, если рабочий' do
    expect(wd.week_day(Date.new(2019, 11, 8))).to eq(5)
  end

  xit 'day_off, если короткий' do
    expect(wd.day_off(Date.new(2019, 6, 11))).to eq(false)
  end

  xit 'day_off, если выходной' do
    expect(wd.day_off(Date.new(2019, 6, 5))).to eq(4)
  end

  it 'type, если короткий' do
    expect(wd.type(Date.new(2019, 3, 7))).to eq(:half_day)
  end

  it 'type, если рабочий' do
    expect(wd.type(Date.new(2019, 2, 7))).to eq(:work_day)
  end

  it 'type, если выходной' do
    expect(wd.type(Date.new(2019, 10, 5))).to eq(:day_off)
  end
end
