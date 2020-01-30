class CategoryNamesController < ApplicationController
    def new
      @category_name = CategoryName.new
    end
    
    def create
       category_name = CategoryName.create(category_name_params)
  
       redirect_to categories_index_path
    end

    private
  
      def category_name_params
        params.require(:category_name).permit(:name)
      end
end
