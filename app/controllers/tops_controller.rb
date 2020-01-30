class TopsController < ApplicationController
  def index
    @categories = Category.left_outer_joins(:category_name)
    @q = ThreadList.ransack(params[:q])
    @thread_lists = @q.result(distinct: true)
  end

  def search
    @q = ThreadList.search(search_params)
    @thread_lists = @q.result(distinct: true)
  end

  private
    def search_params
      params.require(:q).permit!
    end
end
