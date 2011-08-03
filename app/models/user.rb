class User < ActiveRecord::Base   
   has_many :videos, :dependent => :destroy
   has_one :profile, :dependent => :destroy
   
   after_create :create_profile
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates_presence_of :username
  validates_uniqueness_of :username
  
  protected
  
  def create_profile
    @profile = Profile.create :user_id => self.id
    @profile.save
  end
  
end
