class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    respond_to do |format|
      format.html do
        @pages = Page.approved.paginate(:all, :page => params[:page], :per_page => 10)
      end
      format.xml do 
        @pages = Page.approved
        render :xml => @pages
      end
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

end
