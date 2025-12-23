class TariffRule < ApplicationRecord
  validates :hs_code, presence: true
  validates :description, presence: true
  validates :rate,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  def duty_for(declared_value)
    return nil if declared_value.nil?

    rate.to_d * declared_value.to_d / 100
  end
end
