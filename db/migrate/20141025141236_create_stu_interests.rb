class CreateStuInterests < ActiveRecord::Migration
  def change
    create_table :stu_interests do |t|
      t.string :description

      t.timestamps
    end
  end
end
