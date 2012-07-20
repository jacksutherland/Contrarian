class Contrarian < ActiveRecord::Base
  attr_accessible :birth, :death, :description, :display, :name, :is_dead, :image_url
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :quotes
end
