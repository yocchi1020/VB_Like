class Public::TeamCommentsController < ApplicationController
  def create
    team = Team.find(params[:team_id])
    team_comment = current_member.team_comments.new(team_comment_params)
    team_comment.team_id = team.id
    team_comment.save
    redirect_to public_team_path(team)
  end

  private

  def team_comment_params
    params.permit(:introduction, :member_id, :team_id)
  end

end
