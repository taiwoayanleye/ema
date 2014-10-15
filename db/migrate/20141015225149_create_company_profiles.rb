class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :company_name
      t.string :email
      t.text :description
      t.string :company_type
      t.integer :number_of_employees
      t.string :website
      t.string :location
      t.string :reg_code
      t.boolean :verified
      t.string :image

      t.timestamps
    end
  end
end
