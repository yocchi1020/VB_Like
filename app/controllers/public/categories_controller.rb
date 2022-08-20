class Public::CategoriesController < ApplicationController
  private
  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
end
