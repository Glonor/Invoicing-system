class Event < ApplicationRecord
  belongs_to :client
  validate :end_time_after_start_time?

  def end_time_after_start_time?
    if end_time < start_time
      errors.add :end_time, "must be after start date"
    end
  end
end
