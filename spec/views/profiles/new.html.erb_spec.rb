require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :avatar => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :bio => "MyText",
      :website_url => "MyString",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_avatar", :name => "profile[avatar]"
      assert_select "input#profile_first_name", :name => "profile[first_name]"
      assert_select "input#profile_last_name", :name => "profile[last_name]"
      assert_select "textarea#profile_bio", :name => "profile[bio]"
      assert_select "input#profile_website_url", :name => "profile[website_url]"
      assert_select "input#profile_location", :name => "profile[location]"
    end
  end
end
