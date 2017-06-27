class Section < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :chapter
  has_many :lessons
end
