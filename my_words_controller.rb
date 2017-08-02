class MyWordsController < ApplicationController
  # GET /my_words
  # GET /my_words.json
  def index
    @my_words = MyWord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_words }
    end
  end

  # GET /my_words/1
  # GET /my_words/1.json
  def show
    @my_word = MyWord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_word }
    end
  end

  # GET /my_words/new
  # GET /my_words/new.json
  def new
    @my_word = MyWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_word }
    end
  end

  # GET /my_words/1/edit
  def edit
    @my_word = MyWord.find(params[:id])
  end

  # POST /my_words
  # POST /my_words.json
  def create
    @my_word = MyWord.new(params[:my_word])

    respond_to do |format|
      if @my_word.save
        format.html { redirect_to @my_word, notice: 'My word was successfully created.' }
        format.json { render json: @my_word, status: :created, location: @my_word }
      else
        format.html { render action: "new" }
        format.json { render json: @my_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_words/1
  # PUT /my_words/1.json
  def update
    @my_word = MyWord.find(params[:id])

    respond_to do |format|
      if @my_word.update_attributes(params[:my_word])
        format.html { redirect_to @my_word, notice: 'My word was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_words/1
  # DELETE /my_words/1.json
  def destroy
    @my_word = MyWord.find(params[:id])
    @my_word.destroy

    respond_to do |format|
      format.html { redirect_to my_words_url }
      format.json { head :ok }
    end
  end
end
