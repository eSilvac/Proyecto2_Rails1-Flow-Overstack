class RenameTwitterInUserToTwitterurl < ActiveRecord::Migration[5.0]
  def change

    rename_column :users, :twitter, :twitterurl
  
  end
end
