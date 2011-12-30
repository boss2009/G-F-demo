require 'spec_helper'

describe "jobs/show.html.erb" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :title => "Title",
      :job_type => "Job Type",
      :occupation => "Occupation",
      :company_name => "Company Name",
      :location => "Location",
      :url => "Url",
      :description => "MyText",
      :apply_information => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Job Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Occupation/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
