class Product < ActiveRecord::Base
  default_scope :order => 'title'

  # validation stuff...
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  validates_uniqueness_of :title
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => 'must be a URL for GIF, JPG or PNG image.'
  validates_length_of :title, :minimum => minimum = 10, :too_short => "must be at least #{minimum} characters."
end
