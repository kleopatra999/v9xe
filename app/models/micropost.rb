class Micropost
  include Mongoid::Document
  field :content, :type => String
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  attr_accessible :content


  belongs_to :user
end
