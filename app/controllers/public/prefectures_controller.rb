class Public::PrefecturesController < ApplicationController
  private
  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
end
