class Public::TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to public_team_path(@team)
    else
      redirect_to new_public_team_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
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

  private
  def team_params
    params.require(:team).permit(:name, :overview, :achievement, :contact_address, :entry_field, :image, :prefecture_id, :category_id)
  end


end
