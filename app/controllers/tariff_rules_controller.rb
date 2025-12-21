class TariffRulesController < ApplicationController
  before_action :set_tariff_rule, only: %i[ show edit update destroy ]

  # GET /tariff_rules or /tariff_rules.json
  def index
    @tariff_rules = TariffRule.all
  end

  # GET /tariff_rules/1 or /tariff_rules/1.json
  def show
  end

  # GET /tariff_rules/new
  def new
    @tariff_rule = TariffRule.new
  end

  # GET /tariff_rules/1/edit
  def edit
  end

  # POST /tariff_rules or /tariff_rules.json
  def create
    @tariff_rule = TariffRule.new(tariff_rule_params)

    respond_to do |format|
      if @tariff_rule.save
        format.html { redirect_to @tariff_rule, notice: "Tariff rule was successfully created." }
        format.json { render :show, status: :created, location: @tariff_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tariff_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tariff_rules/1 or /tariff_rules/1.json
  def update
    respond_to do |format|
      if @tariff_rule.update(tariff_rule_params)
        format.html { redirect_to @tariff_rule, notice: "Tariff rule was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @tariff_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tariff_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tariff_rules/1 or /tariff_rules/1.json
  def destroy
    @tariff_rule.destroy!

    respond_to do |format|
      format.html { redirect_to tariff_rules_path, notice: "Tariff rule was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tariff_rule
      @tariff_rule = TariffRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tariff_rule_params
      params.expect(tariff_rule: [ :hs_code, :description, :rate ])
    end
end
