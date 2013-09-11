class Car < ActiveRecord::Base
  belongs_to :state
  belongs_to :user
  has_many :assets
  has_and_belongs_to_many :tags
  #has_attached_file 
  accepts_nested_attributes_for :assets
  has_many :comments



end
