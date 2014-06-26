class AddUserIdToComments2 < ActiveRecord::Migration
  def change
     add_column :comments , :id_user, :integer
  end
end
