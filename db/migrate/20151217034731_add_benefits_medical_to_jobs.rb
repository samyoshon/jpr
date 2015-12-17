class AddBenefitsMedicalToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :benefits_medical, :boolean
  end
end
