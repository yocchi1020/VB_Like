class Public::TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new
    if @team.save(team_params)
      redirect_to public_team_path(@team)
    else
      redirect_to new_public_team_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to public_team_path(@team), notice: "無事に更新されました"
    else
      render 'edit'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :overview, :achievement, :contact_address, :entry_field, :image)
  end


end
