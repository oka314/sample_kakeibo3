class VariablecostsController < ApplicationController
 
  def index
    @variablecosts = Variablecost.order(created_at: :asc)
  end

  def show
    @variablecost = Variablecost.find(params[:id])
  end

  def new
    @variablecost = Variablecost.new()
  end

  def edit
    @variablecost = Variablecost.find(params[:id])
  end

  def create
    @variablecost = Variablecost.new(params[:variablecost])
    if @variablecost.save
      redirect_to @variablecost, notice: "ボーナスをとうろくしたよ"
    else
      render "new"
    end

  end

  def update
    @variablecost = Variablecost.find(params[:id])
    @variablecost.assign_attributes(params[:variablecost])
    if @variablecost.save
      redirect_to @variablecost, notice: "ボーナスをとうろくしたよ"
    else
      render "new"
    end  
  end

  def destroy
    @variablecost = Variablecost.find(params[:id])
    @variablecost.destroy
    redirect_to :variablecosts, notice: "けしたよ！"
  end
end

