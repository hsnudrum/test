require 'spec_helper'

describe "teams/index" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
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
      ),
      stub_model(Team,
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
      )
    ])
  end

  it "renders a list of teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Broker Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Broker Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Title Insurance Company Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Title Insurance Company Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Home Inspector Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Home Inspector Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Private Morgage Insurance Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Private Morgage Insurance Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Home Insurance Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Home Insurance Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Painter Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Painter Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Sound Engineer Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Sound Engineer Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Lighting Contractor Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Lighting Contractor Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Water System Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Water System Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Electrician Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Electrician Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Hvac Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Hvac Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Trim Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Trim Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Kitchen And Bath Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Kitchen And Bath Cell".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Flooring Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Flooring Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Water Proofing Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Water Proofing Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Landscaping Id Code".to_s, :count => 2
    assert_select "tr>td", :text => "Landscaping Cell".to_s, :count => 2
  end
end
