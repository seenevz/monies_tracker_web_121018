class SharedExpensesController < ApplicationController
  def show
    @sharedexpense = SharedExpense.find(params[:id])
  end

  def new
   @sharedexpense = SharedExpense.new
   @sharedexpense =SharedExpense.all
  end

  def create
    @sharedexpense = SharedExpense.create(se_params)
  end 

  def edit
    @sharedexpense = SharedExpense.find(params[:id])
  end

  def update
    @sharedexpense = SharedExpense.find(params[:id])
    @sharedexpense.update(params.require(:sharedexpense))
  end

  private

  def se_params
    params.require(:sharedexpense).permit(:name, :amount, :category_id)
   end
end