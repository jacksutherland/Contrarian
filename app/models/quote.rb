class Quote < ActiveRecord::Base
  attr_accessible :entered, :quote, :contrarian_id
  validates :quote, presence: true
  belongs_to :contrarian
end
