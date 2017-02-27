class AddUnvoteableToUnvote < ActiveRecord::Migration[5.0]
  def change
    add_reference :unvotes, :unvoteable, polymorphic: true
  end
end
