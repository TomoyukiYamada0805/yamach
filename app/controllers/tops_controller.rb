class TopsController < ApplicationController
  def index
    @categories = Category.includes([:category_name])
    @q = ThreadList.left_outer_joins(:category_name).left_outer_joins(:response).ransack(params[:q])
    @thread_lists = @q.result(distinct: true).limit(5)
  end

  def search
    @q = ThreadList.left_outer_joins(:category_name).left_outer_joins(:response).search(search_params)
    @thread_lists = @q.result(distinct: true)
  end

  private
    def search_params
      params.require(:q).permit!
    end
end
