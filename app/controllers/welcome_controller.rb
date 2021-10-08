class WelcomeController < ApplicationController
  def index
  end

  def job_search
    StackoverflowSearchJob.perform_later(params[:search])
    flash.notice = 'Request is being processed and results will be available shortly.'
    redirect_to root_path
  end

  def job_listing
    @jobs = Hash.from_xml Rails.cache.read('xml')
  end
end
