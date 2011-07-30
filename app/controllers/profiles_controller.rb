class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :new, :create]

  def show
    @profile = current_user.profile
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  def edit
    @profile = current_user.profile
  end

  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to :action => "show", :notice => 'Profile was successfully created.' }
       # format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
      #  format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @profile = current_user.profile

      if @profile.update_attributes(params[:profile])
        flash[:notice] = "Profile was successfully updated."
        redirect_to :action => "show"
      else
        flash[:error] = "Something went wrong ! Profile was not updated."
        redirect_to :action => "edit"
      end
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
end
