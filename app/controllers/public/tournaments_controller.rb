class Public::TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:notice] = 'Tournament was successfully created.'
      redirect_to public_tournament_path(@tournament)
    else
      redirect_to new_public_tournament_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
  end

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      redirect_to public_tournament_path(@tournament), notice: "無事に更新されました"
    else
      render 'edit'
    end
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name, :schedule, :place, :team_number, :price, :overview, :url, :image)
  end
end
