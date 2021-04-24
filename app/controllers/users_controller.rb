class UsersController < ApplicationController


    get "/sign_up" do
    
        if !logged_in?
        erb :"/users/new"
    end



        #testing errors
        # if flash[:error]="The user doesn't exist."
        # else
        # redirect to "/error"

        # end
end

    post "/sign_up" do

if !logged_in?
    if params[:user][:password] == params[:user][:password_confirmation] &&
        params[:user][:email] && params[:user][:username]
        
        @user = User.new(params[:user])

        
        
        # if @user
        #     redirect to "/login"
        # else
        #     @user = User.new(params[:user])
        # #     @user = User.create!(:username => params[:username], :email => params[:email], :password => 
        # #         params[:password], :user => params[:user])
        # #                      session[:user_id] = @user.id
        # #                      redirect to "/sign_up"
        
        # end


        if @user.save
            session[:user_id] = @user.id
            redirect to "/jabs"
        else
            redirect to "/login"
        end
    else
        redirect to "/sign_up"
    end
else
    redirect to "/jabs"
end
end
end

