class Job
  include DataMapper::Resource

  # Properties
  property :id,           Serial
  property :name,         String,                   :required => true
  property :job_type,     Enum[:shape, :transect]
  property :coordinates,  String,                   :required => true
  property :status,       Enum[:pending, :complete]
  property :notes,        Text

  # Associations
  belongs_to :user
end
