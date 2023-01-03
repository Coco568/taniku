class Calendar < ApplicationRecord
  belongs_to :user,dependent: :destroy
  validates :date_type, presence: true
  validates :record_date, presence: true
  enum date_type: {watering_date: 0, pesticide_date: 1, fertilizer_date: 2}

  def start_time
    self.record_date
  end

  def end_time
    self.record_date
  end
end
