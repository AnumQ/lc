class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :authorize_admin, :only => [ :index ]
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
	@comment = Comment.new(params[:comment])
	@log = Log.find(params[:log_id])
	@comment.log_id = @log.id
	@comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @log, notice: 'Comment was successfully created.' }
        format.json { render json: @log, status: :created, location: @log }
      else
        format.html { redirect_to(@article, :notice => 
        'Comment could not be saved. Please fill in all fields')}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
	@log = @comment.log

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @log, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
	@log = Log.find_by_id(@comment.log_id)
    @comment.destroy
	
    respond_to do |format|
      format.html { redirect_to(@log, :notice => 'Comment was successfully deleted.') }
      format.json { head :no_content }
    end
  end
end
