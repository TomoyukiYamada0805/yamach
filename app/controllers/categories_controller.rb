class CategoriesController < ApplicationController
  def index
  end

  def show
    @threads = CategoryName.left_outer_joins(:thread_list).find_by(uid: params[:id])
  end
end
