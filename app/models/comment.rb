class Comment < ActiveRecord::Base
 validates :text, :presence => true
 belongs_to :user
 #attr_accessible :text 
end
