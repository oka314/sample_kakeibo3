class IncomeValuesController < ApplicationController
  def index
    @incomes = Income.order(create_at: :asc)
    @Income_values = Income_value.order("year_month asc")
  end

  def show
    @income_value = IncomeValue.find(params[:id])
  end

  def new
    year_month_day = params[:year_month] + "-01"
		@year_month = year_month_day.to_date
 
		@incomes = Income.order(created_at: :asc)
		@form = Form::IncomeForm.new
	end
 
	def edit
		@income_value = IncomeValue.find(params[:id])
		@income = Income.find(@income_value.income_id)
	end
 
	def create
		@form = Form::IncomeForm.new(income_form_params)
		if @form.save
			redirect_to :income_values, notice: "とうろくしたよ"
		else
			redirect_to :income_values, notice: "しっぱい"
		end
	end
 
	def income_form_params
		params
			.require(:form_income_form)
			.permit(income_values_attributes: Form::IncomeValue::REGISTRABLE_ATTRIBUTES)
	end
 
	def update
		@income_value = IncomeValue.find(params[:id])
		@income_value.assign_attributes(params[:income_value])
		if @income_value.save
			redirect_to :income_values, notice: "こうしんしたよ！"
		else
			render "edit"
		end
	end
 
	def destroy
		@income_value = IncomeValue.find(params[:id])
		@income_value.destroy
    redirect_to :income_values, notice: "けしたよ"
	end
end

