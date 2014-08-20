require 'spec_helper'
describe Question do
  it 'validate that it has a question' do
    question = Question.new(question: '')
    question.save
    expect(question.save).to eq false
  end
  it { should belong_to :survey }
end
