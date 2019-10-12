require './work_day.rb'

RSpec.describe WorkDay::WorkCalendarDay do
  subject { described_class.new 'data.csv' }

  describe '#type' do
    it { expect(subject.type(Date.new(2019, 3, 7))).to eq(:half_day) }
    it { expect(subject.type(Date.new(2019, 2, 7))).to eq(:work_day) }
    it { expect(subject.type(Date.new(2019, 10, 5))).to eq(:day_off) }
    it { expect(subject.type(Date.new(2200, 10, 5))).to eq(false) }
  end

  describe '' do
    it { expect(subject.week_day(Date.new(2019, 2, 8))).to eq(5) }
    it { expect(subject.week_day(Date.new(2019, 7, 6))).to eq(false) }
    it { expect(subject.week_day(Date.new(2019, 7, 1))).to eq(0) }
  end
end
