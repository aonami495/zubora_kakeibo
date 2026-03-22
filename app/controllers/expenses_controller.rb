class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = current_user.expenses.includes(:category).order(date: :desc)
  end


  def new
    @expense = Expense.new
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def create
    @expense = current_user.expenses.build(expense_params)
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
      redirect_to edit_expense_path, alert: "更新に失敗しました"
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
