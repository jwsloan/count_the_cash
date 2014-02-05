class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
    @budget = Budget.first == nil ? Budget.create : Budget.first
  end
end
