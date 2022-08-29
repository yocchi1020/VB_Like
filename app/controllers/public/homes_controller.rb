class Public::HomesController < ApplicationController

  def top
    @member = current_member
  end

  def about
  end
end
