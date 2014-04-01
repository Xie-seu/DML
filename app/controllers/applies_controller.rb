class AppliesController < ApplicationController
  def index
    @applies = Apply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applies }
    end
  end
  def show
    @apply = Apply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apply }
    end
  end

  # GET /applys/new
  # GET /applys/new.json
  def new
    @apply = Apply.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apply }
    end
  end

  # GET /applys/1/edit
  def edit
    @apply = Apply.find(params[:id])
  end

  # POST /applys
  # POST /applys.json
  def create
    @apply = Apply.new(params[:apply])
    respond_to do |format|
      if @apply.save
        format.html { redirect_to @apply, notice: 'apply was successfully created.' }
        format.json { render json: @apply, status: :created, location: @apply }
      else
        format.html { render action: "new" }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end

  end



  # PUT /applys/1
  # PUT /applys/1.json
  def update
    @apply = Apply.find(params[:id])

    respond_to do |format|
      if @apply.update_attributes(params[:apply])
        format.html { redirect_to @apply, notice: 'apply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applys/1
  # DELETE /applys/1.json
  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy

    respond_to do |format|
      format.html { redirect_to applies_url }
      format.json { head :no_content }
    end
  end
end
