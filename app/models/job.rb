class Job
  include DataMapper::Resource

  # Constants
  JOB_TYPES = [:shape, :transect]

  # Properties
  property :id,           Serial
  property :name,         String,                   :required => true
  property :job_type,     Enum[:shape, :transect]
  property :x1,           String,                   :required => true
  property :x2,           String,                   :required => true
  property :y1,           String,                   :required => true
  property :y2,           String,                   :required => true
  property :status,       Enum[:new, :pending, :complete], :default => :new
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
  
  # Accessor for the valid statuses
  def self.statuses
    Job.properties[:status].class.flags
  end
  
  # Convenience method for printing coordinates
  def coordinates
    "X1:%s Y1:%s X2:%s Y2:%s" % [x1, y1, x2, y2]
  end
  
end
