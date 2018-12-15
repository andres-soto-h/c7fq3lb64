class ExpensesController < ApplicationController

  before_action :authenticate_user!

  def index
    user = current_user

    if params[:concept].present? && !params[:category_id].present?
      @expenses = Expense.where('concept LIKE (?) AND user_id= ?', "%#{params[:concept]}%", user.id)
    elsif params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where('concept LIKE (?) AND category_id = ? AND user_id= ?', "%#{params[:concept]}%", params[:category_id].to_s, user.id)
    elsif !params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where('category_id = ?', params[:category_id].to_s)
    else
      @expenses = Expense.where('user_id= ?', user.id).order("date DESC")
     end
 end
end
