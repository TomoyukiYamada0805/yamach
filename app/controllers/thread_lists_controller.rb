class ThreadListsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @thread_lists = ThreadList.page(params[:page]).per(5).order(created_at: "DESC")
    end
  
    def show
      @thread  = ThreadList.find_by(uid: params[:id])
      @comment = @thread.response.build
      @responses = Response.includes([:user]).where(thread_list_id: @thread.id)
    end
  
    def new
      @thread_list = ThreadList.new
      @thread_list.category.build
    end
  
    def create
       @thread_list = ThreadList.new(thread_params)
       @thread_list.user_id = current_user.id

       if @thread_list.save
        redirect_to action: 'index'
       else
        render 'new'
       end
    end
  
    private
  
      def thread_params
        params.require(:thread_list).permit(:uid, :title, :body, { :category_name_ids => []})
      end
  end
  