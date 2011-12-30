class JobsController < ApplicationController

# + Dec.28.2011
before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
before_filter :find_my_job, only: [:edit, :update, :destroy, :open, :close]

#----------------------------------------
# Index
#----------------------------------------
  def index
	  
#    @jobs = Job.all
#   respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @jobs }
#    end
    if params[:user_id]
      @jobs = User.find(params[:user_id]).jobs.order("id desc")
    elsif params[:keyword]
      @jobs = Job.online.search(params[:keyword])
    else
      @jobs = Job.online.order("id desc")
    end
    
  end

#----------------------------------------
# show
#----------------------------------------
  def show
	  
    @job = Job.find(params[:id])
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @job }
#    end

  end

#----------------------------------------
# new
#----------------------------------------
  def new
	  
#    @job = Job.new
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @job }
#    end
    @job = current_user.jobs.build
    @job.deadline = Time.zone.now + 180.days
    
  end

#----------------------------------------
# edit
#----------------------------------------
  def edit
#    @job = Job.find(params[:id])
  end

#----------------------------------------
# create
#----------------------------------------
  def create
	  
#    @job = Job.new(params[:job])
#    respond_to do |format|
#      if @job.save
#        format.html { redirect_to @job, notice: 'Job was successfully created.' }
#        format.json { render json: @job, status: :created, location: @job }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @job.errors, status: :unprocessable_entity }
#      end
#    end

    @job = current_user.jobs.build(params[:job])
    if @job.save
      redirect_to job_path(@job)
    else
      render :action => :new
    end
    
    
  end
  
#----------------------------------------
# preview
#----------------------------------------
  def preview
    @job = current_user.jobs.build(params[:job])
    @job.created_at = Time.now
    @job.valid?

    render layout: false
  end

#----------------------------------------
# Update
#----------------------------------------
  def update
	  
#    @job = Job.find(params[:id])
#    respond_to do |format|
#      if @job.update_attributes(params[:job])
#        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @job.errors, status: :unprocessable_entity }
#      end
#    end
    if @job.update_attributes(params[:job])
      redirect_to job_path(@job)
    else
      render action: :edit
    end    
    
  end

#----------------------------------------
# Destroy
#----------------------------------------
  def destroy
	  
#    @job = Job.find(params[:id])
#    @job.destroy
#    respond_to do |format|
#      format.html { redirect_to jobs_url }
#      format.json { head :ok }
#    end

    @job.destroy
    redirect_to jobs_path
    
  end
  
#----------------------------------------
# open
#----------------------------------------
  def open
    @job.open
    @job.save!
    
    redirect_to job_path(@job)
  end
  
#----------------------------------------
# close
#----------------------------------------
  def close
    @job.close
    @job.save!
    
    redirect_to job_path(@job)    
  end

  protected

#----------------------------------------
# Find
#----------------------------------------
  def find_my_job
    @job = current_user.jobs.find(params[:id])
  end


end
