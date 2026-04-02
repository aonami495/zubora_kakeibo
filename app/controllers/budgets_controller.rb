class BudgetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @budget = Budget.new
  end

  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  def create
    @budget = current_user.budgets.build(budget_params)
    @budget.month = Date.parse(params[:budget][:month] + "-01") if params[:budget][:month].present?
    if @budget.save
      redirect_to expenses_path, notice: "予算を設定しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @budget = current_user.budgets.find(params[:id])
    @budget.assign_attributes(budget_params)
    @budget.month = Date.parse(params[:budget][:month] + "-01") if params[:budget][:month].present?
    if @budget.save
      redirect_to expenses_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:amount, :month)
  end
end
