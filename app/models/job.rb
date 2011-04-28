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
  validates_numericality_of :y_min, :lte => 49, :gte => 32.5
  validates_numericality_of :y_max, :lte => 49, :gte => 32.5
  validates_numericality_of :x_min, :lte => -96, :gte => -123
  validates_numericality_of :x_max, :lte => -96, :gte => -123
  validates_with_method :validate_coordinates
  validates_with_block do 
    if (coordinate_area < 0.25) 
      true
    else 
      [false, "Coordinate area (#{coordinate_area}) is too large: (x_max - x_min) * (y_max - y_min) must be <0.25."]
    end
  end
  
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
  
  # Output the area of the coordinate rectangle
  def coordinate_area
    (@x_max.to_f - @x_min.to_f) * (@y_max.to_f - @y_min.to_f)
  end
  
  private
  
  def validate_coordinates
    if (@y_max.to_f > @y_min.to_f) && (@x_max.to_f > @x_min.to_f)
      true
    else
      [false, "One of the max coordinates is less than its corresponding min corrdinate."]
    end
  end
  
end