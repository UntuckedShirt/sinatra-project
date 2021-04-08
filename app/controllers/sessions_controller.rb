class SessionsController < ApplicationController

    get "/login" do
        erb :"/users/login"
    end

    post "/login" do

    #     if !logged_in?
    #     if params[:user][:password] == params[:user][:password_confirmation]
    #         params[:user][:email] && params[:user][:username]
    #         @user = User.new(params[:user])
            
    #         if @user.save
    #             session[:user_id] = @user.id
    #             redirect to "/show"
    #         else
    #             redirect to "/login"
    #         end
    #     else
    #         redirect to "/sign_up"
    #     end
    # else
    #     redirect to "/jabs"
    # end
    # end
    # end

        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect to "/jabs"
        else
            redirect to "/jabs"
        end
    end

    get "/logout" do
        if logged_in?
        session.destroy
        redirect to "/sign_up"
        end

        redirect to "/login"

    end
end


