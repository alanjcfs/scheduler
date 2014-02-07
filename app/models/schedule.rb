class Schedule < ActiveRecord::Base
  belongs_to :activity
  has_many :bookings

  validate :reserved_under_or_equal_quantity
  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than_or_equal_to: 0 }

  def increment_reserved(number_of_travelers)
    self.reserved += number_of_travelers
    self.save!
  end

  private
  def reserved_under_or_equal_quantity
    if reserved > quantity
      self.errors.add(:base, "Number of reservations exceed the limit of the number of people")
    end
  end
end
