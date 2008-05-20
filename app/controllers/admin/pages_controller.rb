class Admin::PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.paginate(:all, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  def pending
    @pages = Page.pending.paginate(:all, :page => params[:page], :per_page => 7)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new(:status => params[:from])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect }
      format.xml  { head :ok }
    end
  end

  protected

  # This demonstrates how pages might also be redirecting based on other
  # criteria, so anything that might make this easier would also have to
  # work in a situation like this, even though this particular situation
  # is a bit contrived
  def redirect(object = nil)
    page_number = params[:original_page].blank? ? nil : params[:original_page]
    
    if params[:from] == "pending"
      redirect_to object.nil? ?
      pending_admin_pages_url(:page => page_number) :
      admin_page_url(:id => object, :page => page_number, :from => params[:from])
    else
      redirect_to object.nil? ?
      admin_pages_url(:page => page_number) :
      admin_page_url(:id => object, :page => page_number)
    end
  end  
end
