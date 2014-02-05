class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :date, :time_start, :time_end, :quantity, :activity_id, :reserved
end
