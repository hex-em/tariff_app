class CreateTariffRules < ActiveRecord::Migration[8.1]
  def change
    create_table :tariff_rules do |t|
      t.string :hs_code
      t.string :description
      t.decimal :rate

      t.timestamps
    end
  end
end
