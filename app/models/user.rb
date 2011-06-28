class User

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
         
  before_save :ensure_authentication_token


  property :id,         Serial
  property :admin,      Boolean
  property :first_name, String, :required => true, :default => ''
  property :last_name,  String, :required => true, :default => ''
  property :agency,     String
  property :job_title,  String
  property :city,       String, :required => true, :default => ''
  property :state,      String, :required => true, :default => ''
  
  validates_within :state, :set => UsState.abbreviations
  
  has n, :jobs

  def self.admin_properties
    self.properties - self.properties.select{|p| p.name.to_s =~ /token|password/}
  end
  
  def self.admin_emails
    self.all(:admin => true).map(&:email)
  end

end
