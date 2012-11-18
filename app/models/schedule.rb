class Schedule < ActiveRecord::Base
  attr_accessible :topic_pl, :topic_en, :description_pl, :description_en, :start_time, :end_time, :speaker_id

  belongs_to :speaker

  validates :topic_pl, presence: true
  validates :topic_en, presence: true
  validates :description_pl, presence: true
  validates :description_en, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :speaker_id, presence: true

  def topic
    if I18n.locale == :en
      topic_en
    else
      topic_pl
    end
  end

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end
end