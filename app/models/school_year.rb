class SchoolYear < ActiveRecord::Base
  has_many :posts
  attr_accessible :name
  
  default_scope order("id desc")
end
