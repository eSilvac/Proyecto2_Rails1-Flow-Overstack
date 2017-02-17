class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :unvotes, dependent: :destroy
  has_many :comments, dependent: :destroy

  	def voted_by?(user)
  		votes.exists?(user: user)
  	end

  	def unvoted_by?(user)
  		unvotes.exists?(user: user)
  	end
end
