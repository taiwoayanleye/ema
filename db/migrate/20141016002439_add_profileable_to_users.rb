class AddProfileableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profileable_id, :integer
    add_column :users, :profileable_type, :string
    
    add_index :users, [:profileable_id, :profileable_type]
  end
end
