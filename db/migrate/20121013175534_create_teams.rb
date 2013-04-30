class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.boolean :broker_found
      t.string :broker_id_code
      t.string :broker_cell
      t.boolean :title_insurance_company_found
      t.string :title_insurance_company_id_code
      t.string :title_insurance_company_phone
      t.boolean :home_inspector_found
      t.string :home_inspector_id_code
      t.string :home_inspector_cell
      t.boolean :private_morgage_insurance_found
      t.string :private_morgage_insurance_id_code
      t.string :private_morgage_insurance_phone
      t.boolean :home_insurance_found
      t.string :home_insurance_id_code
      t.string :home_insurance_phone
      t.boolean :painter_found
      t.string :painter_id_code
      t.string :painter_cell
      t.boolean :sound_engineer_found
      t.string :sound_engineer_id_code
      t.string :sound_engineer_cell
      t.boolean :lighting_contractor_found
      t.string :lighting_contractor_id_code
      t.string :lighting_contractor_phone
      t.boolean :water_system_found
      t.string :water_system_id_code
      t.string :water_system_phone
      t.boolean :electrician_found
      t.string :electrician_id_code
      t.string :electrician_cell
      t.boolean :hvac_found
      t.string :hvac_id_code
      t.string :hvac_cell
      t.boolean :trim_found
      t.string :trim_id_code
      t.string :trim_cell
      t.boolean :kitchen_and_bath_found
      t.string :kitchen_and_bath_id_code
      t.string :kitchen_and_bath_cell
      t.boolean :flooring_found
      t.string :flooring_id_code
      t.string :flooring_phone
      t.boolean :water_proofing_found
      t.string :water_proofing_id_code
      t.string :water_proofing_phone
      t.boolean :landscaping_found
      t.string :landscaping_id_code
      t.string :landscaping_cell

      t.timestamps
    end
  end
end
