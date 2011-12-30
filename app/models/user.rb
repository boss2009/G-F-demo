class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise to prevent malicious hackers from creating fake web forms that would allow changing 
  # of passwords through the mass-assignment operations of update_attributes(attrs) and new(attrs)
  #  + Dec.26.2011
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  #  add the ¡§name¡¨ attribute and allow mass updated   + Dec.26.2011
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
    
  # allow users to be created (or edited) with a name attribute. When a user is created, a name and 
  # email address must be present and must be unique (not used before). 
  # Note that Devise (by default) will check that the email address and password are not blank.
  # To validate the presence and uniqueness of the ¡§name¡¨ attribute  + Dec.27.2011
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  # + Dec.28.2011
  has_many :jobs

end
