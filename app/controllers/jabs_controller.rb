class JabsController < ApplicationController


    #index
    get "/jabs" do
        
        # @jabs = Jab.all
        # @jab = Jab.first params[:id]
        # if !logged_in?
        #binding.pry
        @jabs = current_user.jabs
        erb :"jabs/index"   
    end

    #new
    get "/jabs/new" do
        erb :"jabs/new"
end

    #create
    post "/jabs" do
        ##validate params
        current_user.jab.build(params[:posts])

        ## for your pro
        if  !logged_in params[:title] == "" || params[:subject] == "" ||
        params[:content] == ""
        redirect to "/jabs/new"
        else
            @jab = Jab.new(params[:jabs])
            ## verify no SQL injection
            if @jab.save
                @jab.user = current_user
                current_user.jabs << @jab 
                redirect to "/jabs/#{@jab.id}"
            else
                redirect to "/jabs/new"
            end   
        end
end

    #show
    get "/jabs/:id" do
        @jab = Jab.find_by_id(params[:id])
        if @jab && @jab.user == current_user
            erb :"/jabs/show"
        else
            redirect to "/jabs"
        end
end

    #edit
    get "/jabs/:id/edit" do
        @jab = Jab.find_by_id(params[:id])
        if logged_in? && @jab.user == current_user
            if @jab
        erb :"jabs/edit"
            else
                redirect to "/jabs"
         end
    else
        redirecty to "/sign_up"
    end
end

    #update
    patch "/jabs/:id" do
        if !logged_in? params[title] == "" || params[:subject] == "" ||
            params[:content] == ""
            redirect to "/jabs/#{params[:id]}/edit"
        else
            @jab = Jab.find_by_id(params[:id])
            if @jab && @jab_user == current_user && @jab.update(params[:posts])
                redirect to "/jabs/#{@jab.id}"
            else
                redirect to "/jabs/#{params[:id]}/edit"
            end
        end
end

    #delete
delete "/jabs/:id" do
    @jab = Jab.find_by_id(params[:id])
    if @jab && @jab.user == current_user
        @jab.delete
    end
    redirect to "/jabs"
end
end
# end

