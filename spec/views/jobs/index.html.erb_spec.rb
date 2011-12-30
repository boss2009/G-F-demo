require 'spec_helper'

describe "jobs/index.html.erb" do
  before(:each) do
    assign(:jobs, [
      stub_model(Job,
        :title => "Title",
        :job_type => "Job Type",
        :occupation => "Occupation",
        :company_name => "Company Name",
        :location => "Location",
        :url => "Url",
        :description => "MyText",
        :apply_information => "MyText",
        :user_id => 1
      ),
      stub_model(Job,
        :title => "Title",
        :job_type => "Job Type",
        :occupation => "Occupation",
        :company_name => "Company Name",
        :location => "Location",
        :url => "Url",
        :description => "MyText",
        :apply_information => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Job Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Occupation".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
