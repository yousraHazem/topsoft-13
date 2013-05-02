#encoding: utf-8
class CharactersController < ApplicationController

	# GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new
    @project_id = params[:project_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])
    @character.project_id = params[:project_id]

    respond_to do |format|
      if @character.save
        format.html {  redirect_to(:action => 'show', :id => @character.id) }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

   # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])
    @json = Character.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

end