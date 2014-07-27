describe Room do
  let(:room) { build(:room) }

  it { expect(room).to be_valid }

  it { should have_many(:schedules) }
  it { should validate_presence_of(:name) }
end
