class AddUserIdToStuCertifications < ActiveRecord::Migration
  def change
    add_column :stu_certifications, :user_id, :integer
  end
end
