Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password "password"
  f.password_confirmation "password"
end

Factory.define :user_with_jobs, :parent => :user do |f|
  f.jobs [Factory(:job)]
end

Factory.define :admin, :parent => :user do |f|
  f.admin true
end