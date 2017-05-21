class HomeController < ApplicationController
  def index
    @realistic_yield = Loan.optimistic_yearly_yield
  end
end
