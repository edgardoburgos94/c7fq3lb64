class ExpensesController < ApplicationController
  def index
   #@expenses = Expense.order("date DESC")
   concept = params[:concept]
   category_id = params[:category_id]
   # puts concept.length
   # puts category_id.length
   if category_id.length == 0 && concept.length > 0
     expense = Expense.where(concept: params[:concept])
     @expenses = expense
   elsif category_id.length > 0 && concept.length == 0
     expense = Category.find(category_id).expenses
     @expenses = expense
   elsif category_id.length > 0 && concept.length > 0
     expense = Category.find(params[:category_id]).expenses.where(concept: params[:concept])
     @expenses = expense
   else category_id.length == 0 && concept.length == 0
     @expenses = Expense.order("date DESC")
   end
   # puts @expenses
   # puts "-----> LA VARIABLE DE INSTANCIA ES #{@expenses.class}"
  end
end
