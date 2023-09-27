require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.create(
      name: 'Test user',
      email: 'test@example.com',
      password: '123123',
      user_type: UserConstants::SEEKER_TYPE
    )
    expect(user).to be_valid
  end
  it "is not valid without a unique email" do
    # Create a user with a specific email
    User.create(
      name: 'Test user',
      email: 'test@example.com',
      password: '123123',
      user_type: UserConstants::SEEKER_TYPE
    )

    # Attempt to create another user with the same email
    user = User.new(
      name: 'Another user',
      email: 'test@example.com', # Duplicate email
      password: 'password',
      user_type: UserConstants::SEEKER_TYPE
    )

    expect(user).not_to be_valid
  end
end
