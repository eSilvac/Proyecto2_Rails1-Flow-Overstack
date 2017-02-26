# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :unvotes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { minimum: 50 }

  	def voted_by?(user)
  		votes.exists?(user: user)
  	end

  	def unvoted_by?(user)
  		unvotes.exists?(user: user)
  	end
end
