require "rails_helper"

RSpec.describe TariffRule, type: :model do
  describe "#duty_for" do
    let(:tariff_rule) do
      described_class.new(
        hs_code: "7308.40",
        description: "Scaffolding, shoring and propping equipment of iron or steel",
        rate: BigDecimal("0.057")
      )
    end

    it "returns rate * declared value for a positive value" do
      duty = tariff_rule.duty_for(1000)

      expect(duty).to eq(BigDecimal("57.0"))
    end

    it "returns nil when declared value is nil" do
      duty = tariff_rule.duty_for(nil)

      expect(duty).to be_nil
    end

    it "returns nil when declared value is zero" do
      duty = tariff_rule.duty_for(0)

      expect(duty).to be_nil
    end

    it "returns nil when declared value is negative" do
      duty = tariff_rule.duty_for(-100)

      expect(duty).to be_nil
    end
  end

  describe "rate normalization" do
    it "converts percent input (5.7) to decimal (0.057)" do
      rule = described_class.new(
        hs_code: "761090",
        description: "Aluminum structures and parts",
        rate: "5.7"
      )

      rule.valid?  # triggers before_validation

      expect(rule.rate).to eq(BigDecimal("0.057"))
    end

    it "keeps decimal input (0.057) as-is" do
      rule = described_class.new(
        hs_code: "761090",
        description: "Aluminum structures and parts",
        rate: "0.057"
      )

      rule.valid?

      expect(rule.rate).to eq(BigDecimal("0.057"))
    end
  end
end
