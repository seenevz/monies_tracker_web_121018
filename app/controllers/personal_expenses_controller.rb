class PersonalExpensesController < ApplicationController
  def show
    @personalexpense = PersonalExpense.find(params[:id])
  end

  def new
    @personalexpense = PersonalExpense.new
    @personalexpenses = PersonalExpense.all
  end

  def create
    @personalexpense = PersonalExpense.create(pe_params)
  end 

  def edit
    @personalexpense = PersonalExpense.find(params[:id])
  end

  def update
    @personalexpense = PersonalExpense.find(params[:id])
    @personalexpense.update(params.require(:personalexpense))
  end

  private

  def pe_params
    params.require(:personalexpense).permit(:name, :amount, :category_id, :user_id)
   end
end