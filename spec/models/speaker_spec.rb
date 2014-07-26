describe Speaker do
  let(:speaker) { FactoryGirl.build(:speaker) }

  it { expect(speaker).to be_valid }

  it { should have_many(:schedules) }
  it { should validate_presence_of(:name) }
end
