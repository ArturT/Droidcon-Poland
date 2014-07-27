class SchedulePresenter < BasePresenter
  def self.as_json(record)
    {
      id: record.id,
      topic: record.topic,
      description: record.description,
      start_time: record.start_time,
      end_time: record.end_time,
      speaker: record.speaker.as_json,
      room: record.speaker.as_json,
      created_at: record.created_at,
      updated_at: record.updated_at
    }
  end
end
