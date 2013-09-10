class Car < ActiveRecord::Base
  belongs_to :user
  has_many :assets
  #has_attached_file 
  accepts_nested_attributes_for :assets
  has_many :comments


end
