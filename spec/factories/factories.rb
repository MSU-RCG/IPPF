# JOB FACTORY
Factory.define :job do |f|
  f.name        "Name"
  f.job_type    "shape"
  f.x_min       -100.1
  f.x_max       -100
  f.y_min       40
  f.y_max       40.1
  f.status      'pending'
  f.notes       "Here are some notes for the Job"
  f.association :user
  f.after_create { |f| Factory(:job_file, :job => f) }
end

# JOBFILE FACTORY
Factory.define :job_file do |f|
  f.job_uuid "6cf2fff2-5b5c-11e0-ada7-002332d6f1b2"
  f.association :job
end

# USER FACTORIES
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