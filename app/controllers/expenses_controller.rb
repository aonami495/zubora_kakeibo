class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:month].present?
    target_date = Date.parse(params[:month] + "-01")
    else
    target_date = Date.current
    end
  month_range = target_date.beginning_of_month..target_date.end_of_month

  @expenses = current_user.expenses.includes(:category).where(date: month_range).order(date: :desc)
  @total = @expenses.sum(:amount)
  @budget = current_user.budgets.find_by(month: target_date.beginning_of_month)
  @category_totals = current_user.expenses.where(date: month_range).group(:category_id).sum(:amount)
  @current_month = target_date
  end


  def new
    @expense = Expense.new
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    @expense.date = Date.current
    if @expense.save
      redirect_to expenses_path, notice: "保存しました"
    else
      render new_expense_path, alert: "保存に失敗しました"
    end
  end

  def update
    @expense = current_user.expenses.find(params[:id])
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "更新しました"
    else
      render edit_expense_path, alert: "更新に失敗しました"
    end
  end

  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy!
    redirect_to expenses_path, notice: "削除しました"
  end

private
def expense_params
  params.require(:expense).permit(:amount, :date, :category_id)
end
end
