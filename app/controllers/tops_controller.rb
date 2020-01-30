class TopsController < ApplicationController
  def index
    @categories = Category.left_outer_joins(:category_name)
  end
end
