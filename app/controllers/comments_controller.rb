class CommentsController < ApplicationController
  respond_to :html, :json, :js
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    # flash[:notice] = 'Comment was successfully created.' if @comment.save 
    # respond_with @comment, :layout => !request.xhr?

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment.post, :notice => 'Comment was successfully created.') }
        format.js   { render :json => { :success => true, :html => render_to_string(:partial => 'comments/comment', :locals => { :comment => (@comment) }) }, :content_type => "text/json" }
      else
        
        format.html { logger.debug "HTML"; render :action => "new" }
        format.js   { render :json => { "success" => "false" }, :content_type => "text/json" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
