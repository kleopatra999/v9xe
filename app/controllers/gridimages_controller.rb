class GridimagesController < ApplicationController
  # GET /gridimages
  # GET /gridimages.json
  def index
    @gridimages = Gridimage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gridimages }
    end
  end

  # GET /gridimages/1
  # GET /gridimages/1.json
  def show
    @gridimage = Gridimage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gridimage }
    end
  end

  # GET /gridimages/new
  # GET /gridimages/new.json
  def new
    @gridimage = Gridimage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gridimage }
    end
  end

  # GET /gridimages/1/edit
  def edit
    @gridimage = Gridimage.find(params[:id])
  end

  # POST /gridimages
  # POST /gridimages.json
  def create
    @gridimage = Gridimage.new(params[:gridimage])

    respond_to do |format|
      if @gridimage.save
        format.html { redirect_to @gridimage, notice: 'Gridimage was successfully created.' }
        format.json { render json: @gridimage, status: :created, location: @gridimage }
      else
        format.html { render action: "new" }
        format.json { render json: @gridimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gridimages/1
  # PUT /gridimages/1.json
  def update
    @gridimage = Gridimage.find(params[:id])

    respond_to do |format|
      if @gridimage.update_attributes(params[:gridimage])
        format.html { redirect_to @gridimage, notice: 'Gridimage was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gridimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gridimages/1
  # DELETE /gridimages/1.json
  def destroy
    @gridimage = Gridimage.find(params[:id])
    @gridimage.destroy

    respond_to do |format|
      format.html { redirect_to gridimages_url }
      format.json { head :ok }
    end
  end
end
