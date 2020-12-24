class Task < ApplicationRecord
  enum state: { pending: 0, processing: 1, finished: 2 }
  enum piority: { low: 0, medium: 1, high: 2 }
  validates :title, presence: true
  validate :valid_date
  #belongs_to :user
  def valid_date
    if self.start >= self.end
      self.errors.add :start, "#{I18n.t("error_date")}"
    end
  end
end
