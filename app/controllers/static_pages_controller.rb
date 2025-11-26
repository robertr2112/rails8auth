class StaticPagesController < ApplicationController
  allow_unauthenticated_access only: [ :home ]
  before_action :resume_session, only: [ :home ]

  def home
  end

  def contact
  end

  def about
  end

  def help
  end
end
