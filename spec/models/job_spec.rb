require 'rails_helper'

RSpec.describe Job, type: :model do
  it "is valid with valid attributes" do
    job = Job.new(
      title: "Software Engineer",
      description: "Join our engineering team."
    )
    expect(job).to be_valid
  end

  it "is not valid without a title" do
    job = Job.new(description: "Join our engineering team.")
    expect(job).not_to be_valid
  end

  it "is not valid without a description" do
    job = Job.new(title: "Software Engineer")
    expect(job).not_to be_valid
  end
end
