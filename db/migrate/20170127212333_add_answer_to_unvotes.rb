class AddAnswerToUnvotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :unvotes, :answer, foreign_key: true
  end
end
