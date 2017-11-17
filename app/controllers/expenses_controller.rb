class ExpensesController < ApplicationController
before_action :authenticate_user!

  def index

    user_id = current_user.id
    @expenses = User.find(user_id).expenses.order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end

    # #@expenses = Expense.order("date DESC")
    #     category_id = params[:category_id]
    #     concept = params[:concept]
    #     if category_id == nil
    #       category_id = ""
    #     end
    #     if concept == nil
    #       concept = ""
    #     end
    #     if concept == "burral" || concept == "Burral"
    #       concept = "Hamburguesas el burral"
    #       #puts concept
    #     end
    #     user_id = current_user.id
    #     # puts concept.length
    #     # puts category_id.length
    #     if category_id.length == 0 && concept.length > 0
    #       expense = User.find(user_id).expenses.where(concept: concept)
    #       @expenses = expense
    #     elsif category_id.length > 0 && concept.length == 0
    #       expense = Category.find(category_id).expenses
    #     @expenses = expense
    #     elsif category_id.length > 0 && concept.length > 0
    #       expense = Category.find(category_id).expenses.where(concept: concept)
    #       @expenses = expense
    #     else category_id.length == 0 && concept.length == 0
    #        @expenses = User.find(user_id).expenses.order("date DESC")
    #     end
    #     # puts @expenses
    #     # puts "-----> LA VARIABLE DE INSTANCIA ES #{@expenses.class}"
  end
end
