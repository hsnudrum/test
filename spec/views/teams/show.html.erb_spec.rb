require 'spec_helper'

describe "teams/show" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :broker_found => false,
      :broker_id_code => "Broker Id Code",
      :broker_cell => "Broker Cell",
      :title_insurance_company_found => false,
      :title_insurance_company_id_code => "Title Insurance Company Id Code",
      :title_insurance_company_phone => "Title Insurance Company Phone",
      :home_inspector_found => false,
      :home_inspector_id_code => "Home Inspector Id Code",
      :home_inspector_cell => "Home Inspector Cell",
      :private_morgage_insurance_found => false,
      :private_morgage_insurance_id_code => "Private Morgage Insurance Id Code",
      :private_morgage_insurance_phone => "Private Morgage Insurance Phone",
      :home_insurance_found => false,
      :home_insurance_id_code => "Home Insurance Id Code",
      :home_insurance_phone => "Home Insurance Phone",
      :painter_found => false,
      :painter_id_code => "Painter Id Code",
      :painter_cell => "Painter Cell",
      :sound_engineer_found => false,
      :sound_engineer_id_code => "Sound Engineer Id Code",
      :sound_engineer_cell => "Sound Engineer Cell",
      :lighting_contractor_found => false,
      :lighting_contractor_id_code => "Lighting Contractor Id Code",
      :lighting_contractor_phone => "Lighting Contractor Phone",
      :water_system_found => false,
      :water_system_id_code => "Water System Id Code",
      :water_system_phone => "Water System Phone",
      :electrician_found => false,
      :electrician_id_code => "Electrician Id Code",
      :electrician_cell => "Electrician Cell",
      :hvac_found => false,
      :hvac_id_code => "Hvac Id Code",
      :hvac_cell => "Hvac Cell",
      :trim_found => false,
      :trim_id_code => "Trim Id Code",
      :trim_cell => "Trim Cell",
      :kitchen_and_bath_found => false,
      :kitchen_and_bath_id_code => "Kitchen And Bath Id Code",
      :kitchen_and_bath_cell => "Kitchen And Bath Cell",
      :flooring_found => false,
      :flooring_id_code => "Flooring Id Code",
      :flooring_phone => "Flooring Phone",
      :water_proofing_found => false,
      :water_proofing_id_code => "Water Proofing Id Code",
      :water_proofing_phone => "Water Proofing Phone",
      :landscaping_found => false,
      :landscaping_id_code => "Landscaping Id Code",
      :landscaping_cell => "Landscaping Cell"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/Broker Id Code/)
    rendered.should match(/Broker Cell/)
    rendered.should match(/false/)
    rendered.should match(/Title Insurance Company Id Code/)
    rendered.should match(/Title Insurance Company Phone/)
    rendered.should match(/false/)
    rendered.should match(/Home Inspector Id Code/)
    rendered.should match(/Home Inspector Cell/)
    rendered.should match(/false/)
    rendered.should match(/Private Morgage Insurance Id Code/)
    rendered.should match(/Private Morgage Insurance Phone/)
    rendered.should match(/false/)
    rendered.should match(/Home Insurance Id Code/)
    rendered.should match(/Home Insurance Phone/)
    rendered.should match(/false/)
    rendered.should match(/Painter Id Code/)
    rendered.should match(/Painter Cell/)
    rendered.should match(/false/)
    rendered.should match(/Sound Engineer Id Code/)
    rendered.should match(/Sound Engineer Cell/)
    rendered.should match(/false/)
    rendered.should match(/Lighting Contractor Id Code/)
    rendered.should match(/Lighting Contractor Phone/)
    rendered.should match(/false/)
    rendered.should match(/Water System Id Code/)
    rendered.should match(/Water System Phone/)
    rendered.should match(/false/)
    rendered.should match(/Electrician Id Code/)
    rendered.should match(/Electrician Cell/)
    rendered.should match(/false/)
    rendered.should match(/Hvac Id Code/)
    rendered.should match(/Hvac Cell/)
    rendered.should match(/false/)
    rendered.should match(/Trim Id Code/)
    rendered.should match(/Trim Cell/)
    rendered.should match(/false/)
    rendered.should match(/Kitchen And Bath Id Code/)
    rendered.should match(/Kitchen And Bath Cell/)
    rendered.should match(/false/)
    rendered.should match(/Flooring Id Code/)
    rendered.should match(/Flooring Phone/)
    rendered.should match(/false/)
    rendered.should match(/Water Proofing Id Code/)
    rendered.should match(/Water Proofing Phone/)
    rendered.should match(/false/)
    rendered.should match(/Landscaping Id Code/)
    rendered.should match(/Landscaping Cell/)
  end
end
