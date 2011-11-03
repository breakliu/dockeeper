class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :attr

  validates_presence_of :title
  validates_uniqueness_of :title
end
