class PersonalExpensesController < ApplicationController
  before_action :find_personal_exp, except: [:index, :new, :create]
  before_action :find_user, except: [:index, :new, :create]
  
  
  def index
    @user = User.find(params[:user_id])
    @personal_expenses = @user.personal_expenses
    byebug
    p "eof"
  end
  
  def show
    
    @user = @personal_expense.user
  end

  def new
    @user = User.find(params[:user_id])
    @personal_expense = PersonalExpense.new
    # byebug
    @category= Category.new
  end

  def create
    byebug
    @personal_expense = PersonalExpense.create(persona_exp_params)
    redirect_to user_personal_expense_path(@personal_expense)
  end 

  def edit
    
    # byebug
    # @personal_expense = PersonalExpense.find(params[:id])
  end

  def update
    # @personal_expense = PersonalExpense.find(params[:id])
    byebug
    @personal_expense.update(persona_exp_params)
  end

  def destroy
    user = @personal_expense.user
    
    @personal_expense.destroy
    # byebug
    redirect_to user_personal_expenses_path(user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_personal_exp
    @personal_expense = PersonalExpense.find(params[:id])
  end

  def persona_exp_params
    params.require(:personal_expense).permit(:name, :amount, :user_id, category_attributes: [:name])
    
    
   end
end