json.extract! tariff_rule, :id, :hs_code, :description, :rate, :created_at, :updated_at
json.url tariff_rule_url(tariff_rule, format: :json)
