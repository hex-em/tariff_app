class TariffRule < ApplicationRecord
  validates :hs_code, presence: true
  validates :description, presence: true
  validates :rate,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
end
