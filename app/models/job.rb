class Job
  include DataMapper::Resource

  # Constants
  JOB_TYPES = [:shape, :transect]

  # Properties
  property :id,           Serial
  property :name,         String,                   :required => true
  property :job_type,     Enum[:shape, :transect]
  property :coordinates,  String,                   :required => true
  property :status,       Enum[:pending, :complete]
  property :notes,        Text
  property :uuid,         UUID, :default => lambda { UUIDTools::UUID.timestamp_create }
  property :created_at,   DateTime
  property :created_on,   Date
  property :updated_at,   DateTime
  property :updated_on,   Date

  # Associations
  belongs_to  :user
  has n,      :job_files
  
  # Custom Validations
  validates_presence_of :job_files, :if => lambda { |j| j.job_files.count > 0 }
  
  # Accessor for the valid job_types
  def self.job_types
    Job.properties[:job_type].class.flags
  end
  
end
