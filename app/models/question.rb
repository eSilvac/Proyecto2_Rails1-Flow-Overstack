# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
	has_many :votes
	has_many :unvotes
	has_many :comments
	has_many :favorites

	belongs_to :user

  
	def voted_by?(user)
  		votes.exists?(user: user)
  	end
  	def unvoted_by?(user)
  		unvotes.exists?(user: user)
  	end
  	def favorite_by?(user)
  		favorites.exists?(user: user)
  	end
end
