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

require 'test_helper'

class UnvoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
