class TopsController < ApplicationController
  def index
    @categories = CategoryName.all
    @q = ThreadList.left_outer_joins(:category_name).left_outer_joins(:response).order(created_at: "DESC").includes([:user]).ransack(params[:q])
    @thread_lists = @q.result(distinct: true).limit(5)
  end

  def search
    @q = ThreadList.left_outer_joins(:category_name).left_outer_joins(:response).order(created_at: "DESC").includes([:user]).search(search_params)
    @thread_lists = @q.result(distinct: true).page(params[:page]).per(5)
  end

  private
    def search_params
      params.require(:q).permit!
    end
end
