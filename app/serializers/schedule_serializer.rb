class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :date, :time_start, :time_end, :quantity, :activity_id,
    :reserved, :sold_out, :available, :activity

  def sold_out
    object.quantity == object.reserved
  end
end
