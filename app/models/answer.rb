class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :votes
  has_many :unvotes
  has_many :comments

  	def voted_by?(user)
  		votes.exists?(user: user)
  	end

  	def unvoted_by?(user)
  		unvotes.exists?(user: user)
  	end
end
