class Tag < ActiveRecord::Base
  has_and_belongs_to_many :cars
  scope :search_tag, ->(name) { find_by_name(name).cars }
end
