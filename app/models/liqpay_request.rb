class LiqpayRequest < ActiveRecord::Base
  attr_accessible :amount, :description, :status

  validates_presence_of :amount, :description

  enum status: { start: 0, success: 1, failed: 2 }

  after_create :set_status

  private

  def set_status
    update_attribute(:status, 0)
  end
end
