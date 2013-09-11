class Comment < ActiveRecord::Base
  after_create :set_car_state
  validates :text, :presence => true
  belongs_to :car
  belongs_to :user
  belongs_to :state

  #attr_accessible :text
  private
  def set_car_state
    self.car.state = self.state
    self.car.save!
  end
end
