shared_examples 'valid start and end time' do
  before { subject.valid?  }

  it { expect(subject.errors[:start_time]).to be_empty }
  it { expect(subject.errors[:end_time]).to be_empty }
end

shared_examples 'schedule time validator' do
  let(:now) { DateTime.now }

  context 'when start_time and end_time are nil' do
    before do
      subject.start_time = nil
      subject.end_time = nil
    end

    it_behaves_like 'valid start and end time'
  end

  context 'when start_time is nil' do
    before do
      subject.start_time = nil
      subject.end_time = now
    end

    it_behaves_like 'valid start and end time'
  end

  context 'when end_time is nil' do
    before do
      subject.start_time = now
      subject.end_time = nil
    end

    it_behaves_like 'valid start and end time'
  end

  context 'when start time is greater than end time' do
    before do
      subject.start_time = now + 1
      subject.end_time = now
      subject.valid?
    end

    it { expect(subject.errors[:start_time]).to include 'is greater than end time' }
    it { expect(subject.errors[:end_time]).to be_empty }
  end

  context 'when days not eql' do
    before do
      subject.start_time = now
      subject.end_time = now + 1.day
      subject.valid?
    end

    it { expect(subject.errors[:start_time]).to include 'start time day should be equal end time day' }
    it { expect(subject.errors[:end_time]).to be_empty }
  end

  context 'when months not eql' do
    before do
      subject.start_time = now
      subject.end_time = now + 1.month
      subject.valid?
    end

    it { expect(subject.errors[:start_time]).to include 'start time month should be equal end time month' }
    it { expect(subject.errors[:end_time]).to be_empty }
  end

  context 'when years not eql' do
    before do
      subject.start_time = now
      subject.end_time = now + 1.year
      subject.valid?
    end

    it { expect(subject.errors[:start_time]).to include 'start time year should be equal end time year' }
    it { expect(subject.errors[:end_time]).to be_empty }
  end
end
