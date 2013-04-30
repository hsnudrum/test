require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
      :broker_found => false,
      :broker_id_code => "MyString",
      :broker_cell => "MyString",
      :title_insurance_company_found => false,
      :title_insurance_company_id_code => "MyString",
      :title_insurance_company_phone => "MyString",
      :home_inspector_found => false,
      :home_inspector_id_code => "MyString",
      :home_inspector_cell => "MyString",
      :private_morgage_insurance_found => false,
      :private_morgage_insurance_id_code => "MyString",
      :private_morgage_insurance_phone => "MyString",
      :home_insurance_found => false,
      :home_insurance_id_code => "MyString",
      :home_insurance_phone => "MyString",
      :painter_found => false,
      :painter_id_code => "MyString",
      :painter_cell => "MyString",
      :sound_engineer_found => false,
      :sound_engineer_id_code => "MyString",
      :sound_engineer_cell => "MyString",
      :lighting_contractor_found => false,
      :lighting_contractor_id_code => "MyString",
      :lighting_contractor_phone => "MyString",
      :water_system_found => false,
      :water_system_id_code => "MyString",
      :water_system_phone => "MyString",
      :electrician_found => false,
      :electrician_id_code => "MyString",
      :electrician_cell => "MyString",
      :hvac_found => false,
      :hvac_id_code => "MyString",
      :hvac_cell => "MyString",
      :trim_found => false,
      :trim_id_code => "MyString",
      :trim_cell => "MyString",
      :kitchen_and_bath_found => false,
      :kitchen_and_bath_id_code => "MyString",
      :kitchen_and_bath_cell => "MyString",
      :flooring_found => false,
      :flooring_id_code => "MyString",
      :flooring_phone => "MyString",
      :water_proofing_found => false,
      :water_proofing_id_code => "MyString",
      :water_proofing_phone => "MyString",
      :landscaping_found => false,
      :landscaping_id_code => "MyString",
      :landscaping_cell => "MyString"
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teams_path, :method => "post" do
      assert_select "input#team_broker_found", :name => "team[broker_found]"
      assert_select "input#team_broker_id_code", :name => "team[broker_id_code]"
      assert_select "input#team_broker_cell", :name => "team[broker_cell]"
      assert_select "input#team_title_insurance_company_found", :name => "team[title_insurance_company_found]"
      assert_select "input#team_title_insurance_company_id_code", :name => "team[title_insurance_company_id_code]"
      assert_select "input#team_title_insurance_company_phone", :name => "team[title_insurance_company_phone]"
      assert_select "input#team_home_inspector_found", :name => "team[home_inspector_found]"
      assert_select "input#team_home_inspector_id_code", :name => "team[home_inspector_id_code]"
      assert_select "input#team_home_inspector_cell", :name => "team[home_inspector_cell]"
      assert_select "input#team_private_morgage_insurance_found", :name => "team[private_morgage_insurance_found]"
      assert_select "input#team_private_morgage_insurance_id_code", :name => "team[private_morgage_insurance_id_code]"
      assert_select "input#team_private_morgage_insurance_phone", :name => "team[private_morgage_insurance_phone]"
      assert_select "input#team_home_insurance_found", :name => "team[home_insurance_found]"
      assert_select "input#team_home_insurance_id_code", :name => "team[home_insurance_id_code]"
      assert_select "input#team_home_insurance_phone", :name => "team[home_insurance_phone]"
      assert_select "input#team_painter_found", :name => "team[painter_found]"
      assert_select "input#team_painter_id_code", :name => "team[painter_id_code]"
      assert_select "input#team_painter_cell", :name => "team[painter_cell]"
      assert_select "input#team_sound_engineer_found", :name => "team[sound_engineer_found]"
      assert_select "input#team_sound_engineer_id_code", :name => "team[sound_engineer_id_code]"
      assert_select "input#team_sound_engineer_cell", :name => "team[sound_engineer_cell]"
      assert_select "input#team_lighting_contractor_found", :name => "team[lighting_contractor_found]"
      assert_select "input#team_lighting_contractor_id_code", :name => "team[lighting_contractor_id_code]"
      assert_select "input#team_lighting_contractor_phone", :name => "team[lighting_contractor_phone]"
      assert_select "input#team_water_system_found", :name => "team[water_system_found]"
      assert_select "input#team_water_system_id_code", :name => "team[water_system_id_code]"
      assert_select "input#team_water_system_phone", :name => "team[water_system_phone]"
      assert_select "input#team_electrician_found", :name => "team[electrician_found]"
      assert_select "input#team_electrician_id_code", :name => "team[electrician_id_code]"
      assert_select "input#team_electrician_cell", :name => "team[electrician_cell]"
      assert_select "input#team_hvac_found", :name => "team[hvac_found]"
      assert_select "input#team_hvac_id_code", :name => "team[hvac_id_code]"
      assert_select "input#team_hvac_cell", :name => "team[hvac_cell]"
      assert_select "input#team_trim_found", :name => "team[trim_found]"
      assert_select "input#team_trim_id_code", :name => "team[trim_id_code]"
      assert_select "input#team_trim_cell", :name => "team[trim_cell]"
      assert_select "input#team_kitchen_and_bath_found", :name => "team[kitchen_and_bath_found]"
      assert_select "input#team_kitchen_and_bath_id_code", :name => "team[kitchen_and_bath_id_code]"
      assert_select "input#team_kitchen_and_bath_cell", :name => "team[kitchen_and_bath_cell]"
      assert_select "input#team_flooring_found", :name => "team[flooring_found]"
      assert_select "input#team_flooring_id_code", :name => "team[flooring_id_code]"
      assert_select "input#team_flooring_phone", :name => "team[flooring_phone]"
      assert_select "input#team_water_proofing_found", :name => "team[water_proofing_found]"
      assert_select "input#team_water_proofing_id_code", :name => "team[water_proofing_id_code]"
      assert_select "input#team_water_proofing_phone", :name => "team[water_proofing_phone]"
      assert_select "input#team_landscaping_found", :name => "team[landscaping_found]"
      assert_select "input#team_landscaping_id_code", :name => "team[landscaping_id_code]"
      assert_select "input#team_landscaping_cell", :name => "team[landscaping_cell]"
    end
  end
end
