describe Room do
  it { should have_many(:schedules) }
  it { should validate_presence_of(:name) }
end
