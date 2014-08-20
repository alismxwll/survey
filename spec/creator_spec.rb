describe Creator do
  it 'validate that a creator has a name'
  creator = Creator.new(name: '')
  expect(creator.save).to eq false
end
