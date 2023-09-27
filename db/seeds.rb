admin_user = User.create(
  name: 'Admin User',
  email: 'admin@example.com',
  password: '123123',
  user_type: UserConstants::ADMIN_TYPE
)

if admin_user.persisted?
  puts 'Admin user created successfully.'
else
  puts 'Failed to create admin user.'
  puts admin_user.errors.full_messages.join(', ')
end
