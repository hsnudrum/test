class Team < ActiveRecord::Base
  attr_accessible :broker_cell, :broker_found, :broker_id_code, :electrician_cell, :electrician_found, :electrician_id_code, :flooring_found, :flooring_id_code, :flooring_phone, :home_inspector_cell, :home_inspector_found, :home_inspector_id_code, :home_insurance_found, :home_insurance_id_code, :home_insurance_phone, :hvac_cell, :hvac_found, :hvac_id_code, :kitchen_and_bath_cell, :kitchen_and_bath_found, :kitchen_and_bath_id_code, :landscaping_cell, :landscaping_found, :landscaping_id_code, :lighting_contractor_found, :lighting_contractor_id_code, :lighting_contractor_phone, :painter_cell, :painter_found, :painter_id_code, :private_morgage_insurance_found, :private_morgage_insurance_id_code, :private_morgage_insurance_phone, :sound_engineer_cell, :sound_engineer_found, :sound_engineer_id_code, :title_insurance_company_found, :title_insurance_company_id_code, :title_insurance_company_phone, :trim_cell, :trim_found, :trim_id_code, :water_proofing_found, :water_proofing_id_code, :water_proofing_phone, :water_system_found, :water_system_id_code, :water_system_phone
  belongs_to :user

#   validate :leadplace_agent, :on => :update
 
  def leadplace_agent
    errors.add(:broker_id_code, "is not a valid agent number") unless broker_id_code.to_i <= 2000 && broker_id_code.to_i >=1000
  end

  def has_leadplace_agent?
    return false if broker_id_code.blank?
    return broker_id_code.to_i <= 2000 && broker_id_code.to_i >= 1000
  end

end
