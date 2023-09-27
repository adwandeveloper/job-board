require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it "is valid with valid attributes" do
    job_application = JobApplication.new(
      user_id: 1,
      job_id: 1,
      seen: false
    )
    expect(job_application).to be_valid
  end

  it "is not valid without a user_id" do
    job_application = JobApplication.new(
      job_id: 1,
      seen: false
    )
    expect(job_application).not_to be_valid
  end

  it "is not valid without a job_id" do
    job_application = JobApplication.new(
      user_id: 1,
      seen: false
    )
    expect(job_application).not_to be_valid
  end

end
