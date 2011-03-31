Factory.define :job do |f|
  f.name        "Name"
  f.job_type    "shape"
  f.coordinates "1234 567 890"
  f.status      'pending'
  f.notes       "Here are some notes for the Job"
  f.association :user
end
