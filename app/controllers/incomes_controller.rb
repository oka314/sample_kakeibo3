class IncomesController < ApplicationController
  def index
    @incomes = Income.order(created_at: :asc)
	end
 
  def show
    @income = Income.find(params[:id])
	end
 
  def new
    @income = Income.new()
	end
 
  def edit
    @income = Income.find(params[:id])
	end
 
  def create
    @income = Income.new(params[:income])
    if  @income.save
        redirect_to @income,notice:"とうろくしたよ"
    else
      render "new"
    end
	end
 
  def update
    @income = Income.find(params[:id])
    @income.assign_attributes(params[:income])
    if @income.save
       redirect_to incomes_path, notice: "おしごとが作れたよ！"
    else
      render "new"
    end
  end
 
  def destroy
    @income = Income.find(params[:id])
    @income.destroy
     redirect_to :incomes, notice: "けしたよ！"
	end
end
