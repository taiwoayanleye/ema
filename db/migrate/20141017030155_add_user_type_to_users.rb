class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string, :null => false, :default => 1
  end
end
