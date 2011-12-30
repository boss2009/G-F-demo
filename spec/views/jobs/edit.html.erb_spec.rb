require 'spec_helper'

describe "jobs/edit.html.erb" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :title => "MyString",
      :job_type => "MyString",
      :occupation => "MyString",
      :company_name => "MyString",
      :location => "MyString",
      :url => "MyString",
      :description => "MyText",
      :apply_information => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_path(@job), :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_job_type", :name => "job[job_type]"
      assert_select "input#job_occupation", :name => "job[occupation]"
      assert_select "input#job_company_name", :name => "job[company_name]"
      assert_select "input#job_location", :name => "job[location]"
      assert_select "input#job_url", :name => "job[url]"
      assert_select "textarea#job_description", :name => "job[description]"
      assert_select "textarea#job_apply_information", :name => "job[apply_information]"
      assert_select "input#job_user_id", :name => "job[user_id]"
    end
  end
end
