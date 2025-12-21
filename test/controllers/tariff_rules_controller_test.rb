require "test_helper"

class TariffRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tariff_rule = tariff_rules(:one)
  end

  test "should get index" do
    get tariff_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_tariff_rule_url
    assert_response :success
  end

  test "should create tariff_rule" do
    assert_difference("TariffRule.count") do
      post tariff_rules_url, params: { tariff_rule: { description: @tariff_rule.description, hs_code: @tariff_rule.hs_code, rate: @tariff_rule.rate } }
    end

    assert_redirected_to tariff_rule_url(TariffRule.last)
  end

  test "should show tariff_rule" do
    get tariff_rule_url(@tariff_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_tariff_rule_url(@tariff_rule)
    assert_response :success
  end

  test "should update tariff_rule" do
    patch tariff_rule_url(@tariff_rule), params: { tariff_rule: { description: @tariff_rule.description, hs_code: @tariff_rule.hs_code, rate: @tariff_rule.rate } }
    assert_redirected_to tariff_rule_url(@tariff_rule)
  end

  test "should destroy tariff_rule" do
    assert_difference("TariffRule.count", -1) do
      delete tariff_rule_url(@tariff_rule)
    end

    assert_redirected_to tariff_rules_url
  end
end
