class Public::TournamentsController < ApplicationController
  before_action :authenticate_member!
  def new
    @tournament = Tournament.new

  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.member_id = current_member.id
    if @tournament.save
      flash[:notice] = 'Tournament was successfully created.'
      redirect_to public_tournament_path(@tournament)
    else
      redirect_to new_public_tournament_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
  end

  def index
    #presentメソッドはデータが入ってるかどうかを識別するメソッド
    if (params[:prefecture_id]).present?
      @tournaments = Tournament.where(prefecture_id: params[:prefecture_id])
      @tournament_name = Prefecture.find(params[:prefecture_id]).name
      #モデル.where(カラム名: params[:受け取る名前＊カラム名だとわかりやすい])
      #whereメソッドは指定した条件に当てはまるデータを全て取得してくれる
    elsif (params[:category_id]).present?
      @tournaments = Tournament.where(category_id: params[:category_id])
    else
      @tournaments = Tournament.all
    end

    if (params[:category_name]).present?
      @tournament_name = params[:category_name]
    end
    @prefectures = Prefecture.all
    @categories = Category.all

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
    params.require(:tournament).permit(:name, :schedule, :place, :team_number, :price, :overview, :url, :image, :prefecture_id, :category_id)
  end
end
