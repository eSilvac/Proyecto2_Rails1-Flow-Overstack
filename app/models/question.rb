# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  views      :integer
#

class Question < ApplicationRecord
	has_many :votes, as: :voteable, dependent: :destroy
	has_many :unvotes, as: :unvoteable, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :answers,dependent: :destroy

	belongs_to :user

  validates :title, presence: true, length: { minimum: 20, maximum: 100 }
  validates :body, presence: true,length: { minimum: 50 }

  
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
