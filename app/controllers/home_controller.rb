class HomeController < ApplicationController
  before_action :companies_count
  before_action :realistic_yield_percent

  def index
    calculate_revenue if params[:amount]
  end

  private
  def companies_count
    @companies_count = Company.count
  end

  def realistic_yield_percent
    @realistic_yield_percent = Loan.realistic_yearly_yield
  end

  def calculate_revenue
    @amount = params[:amount].to_i
    total_amount_given = @amount * @companies_count

    @realistic_yield  = total_amount_given * (1 + @realistic_yield_percent)
    @optimistic_yield = total_amount_given * (1 + OPTIMISTIC_YIELD)
  end
end
