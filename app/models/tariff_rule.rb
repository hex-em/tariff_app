class TariffRule < ApplicationRecord
  before_validation :normalize_rate

  validates :hs_code, presence: true
  validates :description, presence: true
  validates :rate,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  def duty_for(declared_value)
    return nil if declared_value.nil?

    value = declared_value.to_d
    return nil if value <= 0

    rate.to_d * value
  end

  private

  def normalize_rate
    return if rate.nil?

    numeric = rate.to_d

    # If user typed a percent (e.g., 5.7), convert to decimal (0.057)
    if numeric > 1
      self.rate = numeric / 100
    else
      self.rate = numeric
    end
  end
end
