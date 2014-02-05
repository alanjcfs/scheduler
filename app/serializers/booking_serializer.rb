class BookingSerializer < ActiveModel::Serializer
  attributes :id
  has_many :travelers
end
