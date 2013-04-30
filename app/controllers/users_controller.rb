class UsersController < Devise::SessionsController
  def create
    super
  end
 def update
   #edit here
 end

 def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to accounts
 end

end
