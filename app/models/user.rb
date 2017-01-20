# coding: utf-8
class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  field :name, :type => String
  field :email, :type => String
  #field :create_at, :type => DateTime
  #field :updated_at, :type => DateTime
	field :password_digest,:type=> String
	field :salt, :type => String
  field :remember_token, :type => String
	email_regex = /\A[\w+\-].+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, :presence => true,:uniqueness =>{:case_sensitive => false},:length => { :maximum =>20}
	validates :email, :presence=> true,:uniqueness =>{:case_sensitive=> false},:format => { :with => email_regex}
  attr_accessor :password,:password_confirmation
  has_many :microposts, dependent: :destroy
  has_many :gridimages
  has_many :relationships,:dependent => :destory,:foreign_key => "follower_id"
	has_many :reverse_relationships, :dependent => :destroy,:foreign_key => "followed_id",:class_name => "Relationship"
  before_save :create_remember_token 
    
  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password_digest(pass)
  end
	def self.authenticate(email,password)
		user = User.where(email:email).first
		if user && Digest::SHA256.hexdigest(password + user.salt) == user.password_digest
			return user
		end
    false		
  end
  	#private
	def generate_password_digest(password)
			salt = Array.new(10){rand(1024).to_s(36)}.join
			self.salt, self.password_digest = salt, Digest::SHA256.hexdigest(password + salt)
	end
  
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end 

  def following?(followed)
		!relationships.where(followed_id:followed._id).empty?
	end
	
	def follow!(followed)
		relationships.create!(followed_id: followed._id)
	end

	def unfollow!(followed)
		#relationship.where(followed_id:followed._id).destory
		relationships.destroy_all(conditions: {followed_id: followed._id})
	
	end
 end
