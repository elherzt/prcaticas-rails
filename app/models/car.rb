class Car < ActiveRecord::Base
  searcher do
    binding.pry
    label :tag, :from => :tags, :field => :name
    label :state, :from => :state, :field => :name
  end

  attr_accessor :tag_names
  #attr_accessible :tag_names
   

  belongs_to :state
  belongs_to :user

  has_many :assets
  has_many :comments
  has_and_belongs_to_many :tags
  #has_attached_file 
  accepts_nested_attributes_for :assets
  before_create :associate_tags
  private 
  def associate_tags
    if tag_names
      #binding.pry
      tag_names.split(" ").each do |name|
        self.tags << Tag.find_or_create_by_name(name)
      end
    end
  end
end
