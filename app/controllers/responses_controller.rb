class ResponsesController < ApplicationController

    def create
      thread = ThreadList.find_by(id: params[:thread_list_id])
      response = thread.response.build(response_params)
      response.user_id = current_user.id

      if response.save
        redirect_back(fallback_location: root_path)
      end
    end

    private

      def response_params
        params.require(:response).permit(:comment)
      end 
end
