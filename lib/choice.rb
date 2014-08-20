class Choice <ActiveRecord::Base
  validates :question, presence: true
  belongs_to :question
end
