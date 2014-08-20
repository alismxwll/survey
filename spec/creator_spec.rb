require 'spec_helper'
describe Creator do
  it 'validate that a creator has a name' do
    creator = Creator.new(name: '')
    creator.save
    expect(creator.save).to eq false
  end
end
