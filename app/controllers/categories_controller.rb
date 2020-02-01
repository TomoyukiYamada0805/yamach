class CategoriesController < ApplicationController
  def index
  end

  def show
    @thread_lists = CategoryName.left_outer_joins(:thread_list).find_by(uid: params[:id]).thread_list
  end
end
