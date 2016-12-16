class AccessController < ApplicationController
  def login
  end

  def attempt_login

   	if params[:username].present? && params[:password].present?
   		user_logged_in = User.where(:login => params[:username]).first
      @user_id = user_logged_in.id
      current_user = User.find_by_sql("select firstname from users where id = #{user_logged_in.id};")
      current_user_name = (current_user[0].firstname).to_s
      redirect_to(:controller => "photos",:action => 'index', :user=>current_user_name)



   	end

   end

end



