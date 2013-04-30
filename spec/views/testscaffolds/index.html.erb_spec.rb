require 'spec_helper'

describe "testscaffolds/index" do
  before(:each) do
    assign(:testscaffolds, [
      stub_model(Testscaffold,
        :mystringxx => "Mystringxx",
        :mytextxx => "MyText",
        :myintegerxx => 1,
        :myfloatxx => 1.5,
        :mydecimalxx => "9.99",
        :mybinaryxx => "",
        :mybooleanxx => false,
        :myreferencesxx => nil
      ),
      stub_model(Testscaffold,
        :mystringxx => "Mystringxx",
        :mytextxx => "MyText",
        :myintegerxx => 1,
        :myfloatxx => 1.5,
        :mydecimalxx => "9.99",
        :mybinaryxx => "",
        :mybooleanxx => false,
        :myreferencesxx => nil
      )
    ])
  end

  it "renders a list of testscaffolds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mystringxx".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
