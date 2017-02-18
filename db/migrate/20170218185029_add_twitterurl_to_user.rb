class AddTwitterurlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitterurl, :string
  end
end
