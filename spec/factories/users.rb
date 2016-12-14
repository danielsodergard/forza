FactoryGirl.define do
  factory :user do
    first_name 'Medel'
    last_name 'Svensson'
    email "test@test.com"
    password "secret" 
    password_confirmation "secret"
  end
  
  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email "admin@user.com"
    password "secret" 
    password_confirmation "secret"
  end
end
