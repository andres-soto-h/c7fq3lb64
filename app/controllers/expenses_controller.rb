class ExpensesController < ApplicationController
  def index
    if params[:concept].present? && !params[:category_id].present?
      @expenses = Expense.where('concept LIKE (?)', "%#{params[:concept]}%")
    elsif params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where('concept LIKE (?) AND category_id = ?', "%#{params[:concept]}%", params[:category_id].to_s)
    elsif !params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where('category_id = ?', params[:category_id].to_s)
    else
      @expenses = Expense.order('date DESC')
     end
 end
end
