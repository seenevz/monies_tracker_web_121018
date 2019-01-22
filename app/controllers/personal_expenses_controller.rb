class PersonalExpensesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @personal_expenses = @user.personal_expenses
  end
  
  def show    
    @personal_expense = PersonalExpense.find(params[:id])
  end

  def new
    @personalexpense = PersonalExpense.new
    @personal_expenses = PersonalExpense.all
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