class Public::TeamsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update]
  def new
    @team = Team.new
    @team.members << current_member
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_member
    @team.members << current_member
    if @team.save
      redirect_to public_team_path(@team)
    else
      redirect_to new_public_team_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
  end

  def join
    @team = Team.find(params[:team_id])
    @team.members << current_member
    redirect_to  public_teams_path
  end

  def index
    #presentメソッドはデータが入ってるかどうかを識別するメソッド
    if (params[:prefecture_id]).present?
      @teams = Team.where(prefecture_id: params[:prefecture_id])
      #モデル.where(カラム名: params[:受け取る名前＊カラム名だとわかりやすい])
      #whereメソッドは指定した条件に当てはまるデータを全て取得してくれる
    elsif (params[:category_id]).present?
      @teams = Team.where(category_id: params[:category_id])
    else
      @teams = Team.all
    end

    if (params[:prefecture_name]).present?
      @team_name = params[:prefecture_name]
    elsif (params[:category_name]).present?
      @team_name = params[:category_name]
    end
    @prefectures = Prefecture.all
    @categories = Category.all
  end

  def show
    @team = Team.find(params[:id])
    @team_comment = TeamComment.new
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

  def destroy
    @team = Team.find(params[:id])
#current_memberは、@group.membersから消されるという記述。
    @team.members.delete(current_member)
    redirect_to public_teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name, :overview, :achievement, :contact_address, :entry_field, :image, :prefecture_id, :category_id, :owner_id, member_ids: [] )
  end

  def ensure_correct_member
    @team = Team.find(params[:id])
    unless @team.owner_id == current_member.id
      redirect_to public_teams_path
    end
  end

end
