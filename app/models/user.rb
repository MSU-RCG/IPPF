class User

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
         
  before_save :ensure_authentication_token


  property :id,    Serial
  property :admin, Boolean
  
  has n, :jobs

end
