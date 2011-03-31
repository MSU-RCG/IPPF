class JobFile
  include DataMapper::Resource

  # Propeties
  property :id,           Serial
  property :file,         String,   :auto_validation => false
  property :created_at,   DateTime
  property :created_on,   Date
  property :updated_at,   DateTime
  property :updated_on,   Date
  
  # Associations
  belongs_to :job
  
  # Carrierwave File
  mount_uploader :file, FileUploader
end
