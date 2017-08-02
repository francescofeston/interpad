class MyGlossariesController < ApplicationController
  # GET /my_glossaries
  # GET /my_glossaries.json
  def index
    @my_glossaries = MyGlossary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_glossaries }
    end
  end

  # GET /my_glossaries/1
  # GET /my_glossaries/1.json
  def show
    @my_glossary = MyGlossary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_glossary }
    end
  end

  # GET /my_glossaries/new
  # GET /my_glossaries/new.json
  def new
    @my_glossary = MyGlossary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_glossary }
    end
  end

  # GET /my_glossaries/1/edit
  def edit
    @my_glossary = MyGlossary.find(params[:id])
  end

  # POST /my_glossaries
  # POST /my_glossaries.json
  def create
    @my_glossary = MyGlossary.new(params[:my_glossary])

    respond_to do |format|
      if @my_glossary.save
        format.html { redirect_to @my_glossary, notice: 'My glossary was successfully created.' }
        format.json { render json: @my_glossary, status: :created, location: @my_glossary }
      else
        format.html { render action: "new" }
        format.json { render json: @my_glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_glossaries/1
  # PUT /my_glossaries/1.json
  def update
    @my_glossary = MyGlossary.find(params[:id])

    respond_to do |format|
      if @my_glossary.update_attributes(params[:my_glossary])
        format.html { redirect_to @my_glossary, notice: 'My glossary was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_glossaries/1
  # DELETE /my_glossaries/1.json
  def destroy
    @my_glossary = MyGlossary.find(params[:id])
    @my_glossary.destroy

    respond_to do |format|
      format.html { redirect_to my_glossaries_url }
      format.json { head :ok }
    end
  end
end
