class ResponsesController < ApplicationController

    def index
      thread_list = ThreadList.find(params[:thread_list_id])
      redirect_to thread_list_path(id: thread_list.uid)
    end

    def create
      @thread = ThreadList.find_by(id: params[:thread_list_id])
      @responses = Response.includes([:user]).where(thread_list_id: @thread.id)
      @comment = @thread.response.build(response_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to thread_list_path(id: @thread.uid)
      else
        render 'thread_lists/show'
      end
    end

    private

      def response_params
        params.require(:response).permit(:comment)
      end 
end
