class Task < ApplicationRecord
  enum state: { pending: 0, processing: 1, finished: 2 }
  enum piority: { low: 0, medium: 1, high: 2 }
  validates :title, presence: true
  validate :valid_date
  #belongs_to :user
  def valid_date
    if start_time >= end_time
      errors.add :start_time, "#{I18n.t("error_date")}"
    end
  end
end
