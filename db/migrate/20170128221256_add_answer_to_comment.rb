class AddAnswerToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :answer, foreign_key: true
  end
end
