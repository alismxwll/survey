require 'spec_helper'
describe Survey do
  it 'validates the survey has a name' do
    survey = Survey.new({:name => '' })
    survey.save
    expect(survey.save).to eq false
  end

  it { should have_many :questions }
end
