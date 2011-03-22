class Job

  include DataMapper::Resource

  property :id, Serial

  property :name, String
  property :job_type, String
  property :user_id, Integer
  property :coordinates, String
  property :status, String
  property :notes, Text

end
