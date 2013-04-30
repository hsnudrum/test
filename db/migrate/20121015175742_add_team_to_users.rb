class AddTeamToUsers < ActiveRecord::Migration

  def up
#    (User.all.select{|u| u.team.blank?}).each{|uu| uu.team = Team.new; uu.save}
  end

  def down
    # (User.all.select{|u| u.team.blank?}).each do |uu|
    #   t = uu.team
    #   t.user = nil
    #   t.destroy
    # end 
  end

end


