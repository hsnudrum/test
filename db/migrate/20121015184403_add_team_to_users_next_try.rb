class AddTeamToUsersNextTry < ActiveRecord::Migration

  def up
    User.all.each &:create_team
  end

  def down
    User.all.each{|u| u.team.destroy}
  end


end
