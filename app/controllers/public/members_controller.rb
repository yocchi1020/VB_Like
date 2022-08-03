class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def index
  end

  def edit
  end

  def unsubscribe
  end
end
