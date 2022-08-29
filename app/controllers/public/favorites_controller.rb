class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  def create
    tournament = Tournament.find(params[:tournament_id])
    favorite = current_member.favorites.new(tournament_id: tournament.id)
    favorite.save
    redirect_to public_tournament_path(tournament)
  end

  def destroy
    tournament = Tournament.find(params[:tournament_id])
    favorite = current_member.favorites.find_by(tournament_id: tournament.id)
    favorite.destroy
    redirect_to public_tournament_path(tournament)
  end
end
