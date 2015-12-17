class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.string :title
      t.text :description
      t.string :city_id
      t.string :country_id
      t.text :qualifications
      t.string :salary_low
      t.string :salary_high
      t.text :benefits_description
      t.boolean :benefits_airfare
      t.boolean :benefits_housing
      t.boolean :benefits_pto
      t.boolean :benefits_sick
      t.text :additional_info
      t.text :how_to
      t.integer :adtype_id

      t.timestamps null: false
    end
  end
end
