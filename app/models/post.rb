class Post < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title
  validates_uniqueness_of :title
end
