# == Schema Information
#
# Table name: unvotes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :integer
#

class Unvote < ApplicationRecord
  belongs_to :user
  belongs_to :unvoteable, polymorphic: true
end
