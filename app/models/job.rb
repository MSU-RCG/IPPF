class Job
  include DataMapper::Resource

  # Properties
  property :id,           Serial
  property :name,         String,                   :required => true
  property :job_type,     Enum[:shape, :transect]
  property :x_min,        Float,                    :required => true
  property :x_max,        Float,                    :required => true
  property :y_min,        Float,                    :required => true
  property :y_max,        Float,                    :required => true
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
  validates_presence_of :job_files
  
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
    "Xmin:%s Ymin:%s Xmax:%s Ymax:%s" % [x_min, y_min, x_max, y_max]
  end
  
end