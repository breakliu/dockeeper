class AttrsController < ApplicationController
  # GET /attrs
  # GET /attrs.json
  def index
    @attrs = Attr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attrs }
    end
  end

  # GET /attrs/1
  # GET /attrs/1.json
  def show
    @attr = Attr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attr }
    end
  end

  # GET /attrs/new
  # GET /attrs/new.json
  def new
    @attr = Attr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attr }
    end
  end

  # GET /attrs/1/edit
  def edit
    @attr = Attr.find(params[:id])
  end

  # POST /attrs
  # POST /attrs.json
  def create
    @attr = Attr.new(params[:attr])

    respond_to do |format|
      if @attr.save
        format.html { redirect_to @attr, notice: 'Attr was successfully created.' }
        format.json { render json: @attr, status: :created, location: @attr }
      else
        format.html { render action: "new" }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attrs/1
  # PUT /attrs/1.json
  def update
    @attr = Attr.find(params[:id])

    respond_to do |format|
      if @attr.update_attributes(params[:attr])
        format.html { redirect_to @attr, notice: 'Attr was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attrs/1
  # DELETE /attrs/1.json
  def destroy
    @attr = Attr.find(params[:id])
    @attr.destroy

    respond_to do |format|
      format.html { redirect_to attrs_url }
      format.json { head :ok }
    end
  end
end
