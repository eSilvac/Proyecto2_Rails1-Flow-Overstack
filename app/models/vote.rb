# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :integer
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :question, optional: true
  belongs_to :answer, optional: true

  
end
