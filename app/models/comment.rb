class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question, optional: true
  belongs_to :answer, optional: true

  validates :body, presence: true, length: { maximum: 200 }
end
