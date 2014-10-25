class AddUserIdToStuInterests < ActiveRecord::Migration
  def change
    add_column :stu_interests, :user_id, :integer
  end
end
