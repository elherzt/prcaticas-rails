class Comment < ActiveRecord::Base
  before_create :set_previous_state
  after_create :set_car_state
  validates :text, :presence => true
  belongs_to :car
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"

  #attr_accessible :text
  private
  def set_previous_state
    self.previous_state = car.state
  end
  def set_car_state
    self.car.state = self.state
    self.car.save!
  end
end
