class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :attr
  belongs_to :school_year

  validates_presence_of :title
  validates_uniqueness_of :title

  default_scope order("id desc")
end
