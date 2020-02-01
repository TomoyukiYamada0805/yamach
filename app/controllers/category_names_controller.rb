class CategoryNamesController < ApplicationController
    before_action :administer?

    def new
      @category_name = CategoryName.new
    end
    
    def create
       category_name = CategoryName.create(category_name_params)
  
       redirect_to root_path
    end

    private
  
      def category_name_params
        params.require(:category_name).permit(:name)
      end

      def administer?
        redirect_to root_path if current_user.authority.to_i != 1
      end
end
