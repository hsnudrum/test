class TeamsController < InheritedResources::Base

  def update
    @team = Team.find(params[:id])
    
    respond_to do |format|
      if @team.update_attributes(params[:team])
        @account = @team.user.account
        @message = @account.build_your_team? == "INPROC" ? "Your team still needs attention" : 'Team was successfully started!'
        format.html { redirect_to @account, notice: @message }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  
end

