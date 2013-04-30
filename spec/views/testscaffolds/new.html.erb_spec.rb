require 'spec_helper'

describe "testscaffolds/new" do
  before(:each) do
    assign(:testscaffold, stub_model(Testscaffold,
      :mystringxx => "MyString",
      :mytextxx => "MyText",
      :myintegerxx => 1,
      :myfloatxx => 1.5,
      :mydecimalxx => "9.99",
      :mybinaryxx => "",
      :mybooleanxx => false,
      :myreferencesxx => nil
    ).as_new_record)
  end

  it "renders new testscaffold form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => testscaffolds_path, :method => "post" do
      assert_select "input#testscaffold_mystringxx", :name => "testscaffold[mystringxx]"
      assert_select "textarea#testscaffold_mytextxx", :name => "testscaffold[mytextxx]"
      assert_select "input#testscaffold_myintegerxx", :name => "testscaffold[myintegerxx]"
      assert_select "input#testscaffold_myfloatxx", :name => "testscaffold[myfloatxx]"
      assert_select "input#testscaffold_mydecimalxx", :name => "testscaffold[mydecimalxx]"
      assert_select "input#testscaffold_mybinaryxx", :name => "testscaffold[mybinaryxx]"
      assert_select "input#testscaffold_mybooleanxx", :name => "testscaffold[mybooleanxx]"
      assert_select "input#testscaffold_myreferencesxx", :name => "testscaffold[myreferencesxx]"
    end
  end
end
