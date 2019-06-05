class ProfilesController < ApplicationController
  SOURCE = ['www.proz.com/profile']

  def index
    @profiles = Profile.all
  end

  def new
    @source = SOURCE
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile =  case params['profile']['source']
                when 'www.proz.com/profile'
                  ProfileProzParsingService.create(params['profile']['source_link'])
                end

    redirect_to profile_path(@profile)
  end
end
