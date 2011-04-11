class JobFile
  include DataMapper::Resource

  # Propeties
  property :id,           Serial
  property :file,         String,   :auto_validation => false
  property :job_uuid,     UUID,     :required => true
  property :name,         String
  property :type,         String
  property :extension,    String
  property :created_at,   DateTime
  property :created_on,   Date
  property :updated_at,   DateTime
  property :updated_on,   Date
  
  # Associations
  belongs_to :job,                  :required => false
  
  # Carrierwave File
  mount_uploader :file, FileUploader
end
