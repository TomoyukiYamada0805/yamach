class CategoriesController < ApplicationController
  def index
  end

  def show
    @category_name = CategoryName.left_outer_joins(:thread_list).find_by(uid: params[:id])
    @thread_lists = @category_name.thread_list.page(params[:page]).per(5)
  end
end
