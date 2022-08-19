class Admin::TournamentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to admin_tournaments_path
  end
end
