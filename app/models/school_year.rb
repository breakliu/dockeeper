class SchoolYear < ActiveRecord::Base
  has_many :posts
  
  default_scope order("id desc")
end
