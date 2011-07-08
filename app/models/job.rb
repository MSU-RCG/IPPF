class Job
  include DataMapper::Resource

  # Properties
  property :id,           Serial
  property :name,         String,                   :required => true
  property :job_type,     Enum[:shape, :transect],  :required => true, :default => :shape
  property :x_min,        Float,                    :required => true, :default => -123
  property :x_max,        Float,                    :required => true, :default => -122.9
  property :y_min,        Float,                    :required => true, :default => 32.5
  property :y_max,        Float,                    :required => true, :default => 32.6
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
  validates_within :job_type, :set => Job.properties[:job_type].class.flags
  validates_within :status,   :set => Job.properties[:status].class.flags
  validates_with_method :validate_coordinates
  validates_with_block do 
    if (coordinate_area < 0.25) 
      true
    else 
      [false, "Coordinate area (#{coordinate_area}) is too large: (x_max - x_min) * (y_max - y_min) must be <0.25."]
    end
  end
  
  # Hooks
  after :create, :send_create_notification
  after :create, :create_coords_file
  after :update, :send_complete_notification
  
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
  
  def complete_files_exist?
    !Dir.glob(complete_files_dir + '/*').empty?
  end
  
  def complete_files_dir
    Rails.public_path + File.dirname(self.job_files.first.file_url) + '/complete'
  end
  
  def coords_file_path
    Rails.public_path + "/uploads/#{@uuid}/coords.txt"
  end
  
  def complete_files
    files = []
    if complete_files_exist?
      Dir.glob(complete_files_dir + '/*').each do |f|
        files << f.gsub(Rails.root.to_s + '/public', '')
      end
    end
    files
  end
  
  def new_job?
    @status == :new
  end
  
  def pending_job?
    @status == :pending
  end
  
  def complete_job?
    @status == :complete
  end

  
  def create_coords_file
    File.open(coords_file_path, 'w+') do |f|
      f.write <<-EOF.gsub(/^ {6}/,'')
      x_min = #{x_min}
      x_max = #{x_max}
      y_min = #{y_min}
      y_max = #{y_max}
      EOF
    end
  end
  alias :generate_coords_txt :create_coords_file 

  private
  
  def send_create_notification
    JobMailer.job_created(self) if new_job?
  end
  
  def send_complete_notification
    JobMailer.job_complete(self) if complete_job?
  end

  def validate_coordinates
    if (@y_max.to_f > @y_min.to_f) && (@x_max.to_f > @x_min.to_f)
      true
    else
      [false, "One of the max coordinates is less than its corresponding min corrdinate."]
    end
  end

end