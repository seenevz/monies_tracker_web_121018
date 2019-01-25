class PersonalExpensesController < ApplicationController
  before_action :find_personal_exp, except: [:index, :new, :create]
  before_action :find_user , except: [:create, :destroy]
  before_action :authorized?, only: [:index, :show, :edit, :new]
  
  def index
    @personal_expenses = @user.personal_expenses    
  end
  
  def show
  end

  def new
    # shared_expense = false


    # if shared_expense
      @personal_expense = PersonalExpense.new
      @category= Category.new
  end

  def create
    @user = User.find(params.require(:personal_expense).permit(:user_id)[:user_id])
    # byebug

    @personal_expense = PersonalExpense.create(persona_exp_params)
    redirect_to user_personal_expense_path(@user, @personal_expense)
  end 

  def edit
    
  end

  def update
    
    @personal_expense.update(persona_exp_params)
    redirect_to user_personal_expense_path(@user, @personal_expense)
  end

  def destroy
    user = @personal_expense.user_id
    @personal_expense.destroy
    redirect_to user_path(user)
  end
  
  private
  
  def find_user
    
    #  byebug
    @user = User.find(params[:user_id])
  end

  def find_personal_exp
    @personal_expense = PersonalExpense.find(params[:id])
  end

  def persona_exp_params
    params.require(:personal_expense).permit(:name, :amount, :user_id, category_attributes: [:name])    
   end

end