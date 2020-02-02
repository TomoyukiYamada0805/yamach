class ResponsesController < ApplicationController

    def create
      @thread = ThreadList.find_by(id: params[:thread_list_id])
      @responses = Response.includes([:user]).where(thread_list_id: @thread.id)
      @comment = @thread.response.build(response_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        render 'thread_lists/show'
      end
    end

    private

      def response_params
        params.require(:response).permit(:comment)
      end 
end
