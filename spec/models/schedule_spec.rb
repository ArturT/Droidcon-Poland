describe Schedule do
  it { should belong_to(:speaker) }
  it { should belong_to(:room) }
  it { should validate_presence_of(:room_id) }
end
