class PersonalExpensesController < ApplicationController
  before_action :find_personal_exp, except: [:index, :new]
  
  
  def index
    @user = User.find(params[:user_id])
    @personal_expenses = @user.personal_expenses
  end
  
  def show
    
    @user = @personal_expense.user
  end

  def new
    @personal_expense = PersonalExpense.new
    @personal_expenses = PersonalExpense.all
  end

  def create
    @personal_expense = PersonalExpense.create(persona_exp_params)
  end 

  def edit
    @personal_expense = PersonalExpense.find(params[:id])
  end

  def update
    @personal_expense = PersonalExpense.find(params[:id])
    @personal_expense.update(persona_exp_params)
  end

  def destroy
    user = @personal_expense.user
    
    @personal_expense.destroy
    byebug
    redirect_to user_personal_expenses_path(user)
  end

  private

  def find_personal_exp
    @personal_expense = PersonalExpense.find(params[:id])
  end

  def persona_exp_params
    params.require(:personal_expense).permit(:name, :amount, :category_id, :user_id)
   end
end