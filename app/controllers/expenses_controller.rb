class ExpensesController < ApplicationController
  def index
   #@expenses = Expense.order("date DESC")
   concept = params[:concept]
   category_id = params[:category_id]
   puts concept == nil
   puts category_id.class

   if category_id.class == nil && concept.class != nil
     expense = Expense.where(concept: params[:concept])
     @expenses = expense
   elsif category_id.class != nil && concept.class == nil
     expense = Category.find(category_id).expenses
     @expenses = expense
   elsif category_id.class != nil && concept.class != nil
     expense = Category.find(params[:category_id]).expenses.where(concept: params[:concept])
     @expenses = expense
   else category_id.class == nil && concept.class == nil
     @expenses = Expense.order("date DESC")
   end
   # puts @expenses
   # puts "-----> LA VARIABLE DE INSTANCIA ES #{@expenses.class}"
  end
end
