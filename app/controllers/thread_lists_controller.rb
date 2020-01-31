class ThreadListsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @thread_list = ThreadList.all
    end
  
    def show
      @thread  = ThreadList.find_by(uid: params[:id])
      @comment = @thread.response.build
      @responses = Response.where(thread_list_id: @thread.id).left_outer_joins(:user)
    end
  
    def new
      @thread_list = ThreadList.new
      @thread_list.category.build
    end
  
    def create
       thread_list = ThreadList.create(thread_params)
  
       redirect_to action: 'index'
    end
  
    private
  
      def thread_params
        params.require(:thread_list).permit(:uid, :title, :body, { :category_name_ids => []})
      end
  end
  