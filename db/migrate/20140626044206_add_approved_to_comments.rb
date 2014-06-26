class AddApprovedToComments < ActiveRecord::Migration
  def change
    add_column :comments , :approved, :integer, :default => 0
  end
end
