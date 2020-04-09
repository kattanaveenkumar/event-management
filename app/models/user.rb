class User < ApplicationRecord
  validates_uniqueness_of :email

  has_many :permissions
  has_many :roles, through: :permissions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_user_role

  def role?(role)
  	self.roles.pluck(:name).include? role
  end

  def self.hosts
  	User.all.collect { | user | [user.name, user.id] if user.role? "host"}.compact
  end

  def is_host?
  	self.role? "host"
  end  
  
  private

  def assign_user_role
  	Permission.create(user_id: self.id, role_id: Role.last.id)
  end
     
end
