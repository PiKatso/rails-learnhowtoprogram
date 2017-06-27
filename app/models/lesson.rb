class Lesson < ActiveRecord::Base
  validates :name, :content, :number, :presence => true
  belongs_to :section
end
