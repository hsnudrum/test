require 'spec_helper'

describe "testscaffolds/show" do
  before(:each) do
    @testscaffold = assign(:testscaffold, stub_model(Testscaffold,
      :mystringxx => "Mystringxx",
      :mytextxx => "MyText",
      :myintegerxx => 1,
      :myfloatxx => 1.5,
      :mydecimalxx => "9.99",
      :mybinaryxx => "",
      :mybooleanxx => false,
      :myreferencesxx => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mystringxx/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/9.99/)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
