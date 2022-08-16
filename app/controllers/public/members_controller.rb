class Public::MembersController < ApplicationController
  def show
    @member = current_member
    @team_comment = TeamComment.new
  end

  def index
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to public_member_path
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def favorites
    @member = Member.find(params[:id])
    favorites= Favorite.where(member_id: @member.id).pluck(:tournament_id)
    @favorite_tournaments = Tournament.find(favorites)
  end

  private
    def member_params
      params.require(:member).permit(:name, :nickname, :email, :telephone_number, :team_id)
    end

    def set_member
      @member = Member.find(params[:id])
    end
end
