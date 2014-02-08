# @author John Sloan
# Budget exists just to hold envelopes.
# Currently acting as a singleton
class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
    @budget = Budget.first.nil? ? Budget.create : Budget.first
  end
end
