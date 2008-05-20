class Admin::SecretsController < ApplicationController
  # GET /admin_secrets
  # GET /admin_secrets.xml
  def index
    @admin_secrets = Admin::Secret.paginate(:all, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_secrets }
    end
  end

  # GET /admin_secrets/1
  # GET /admin_secrets/1.xml
  def show
    @admin_secret = Admin::Secret.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_secret }
    end
  end

  # GET /admin_secrets/new
  # GET /admin_secrets/new.xml
  def new
    @admin_secret = Admin::Secret.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_secret }
    end
  end

  # GET /admin_secrets/1/edit
  def edit
    @admin_secret = Admin::Secret.find(params[:id])
  end

  # POST /admin_secrets
  # POST /admin_secrets.xml
  def create
    @admin_secret = Admin::Secret.new(params[:secret])

    respond_to do |format|
      if @admin_secret.save
        flash[:notice] = 'Admin::Secret was successfully created.'
        format.html { redirect(@admin_secret) }
        format.xml  { render :xml => @admin_secret, :status => :created, :location => @admin_secret }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_secret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_secrets/1
  # PUT /admin_secrets/1.xml
  def update
    @admin_secret = Admin::Secret.find(params[:id])

    respond_to do |format|
      if @admin_secret.update_attributes(params[:secret])
        flash[:notice] = 'Admin::Secret was successfully updated.'
        format.html { redirect(@admin_secret) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_secret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_secrets/1
  # DELETE /admin_secrets/1.xml
  def destroy
    @admin_secret = Admin::Secret.find(params[:id])
    @admin_secret.destroy

    respond_to do |format|
      format.html { redirect }
      format.xml  { head :ok }
    end
  end

  protected
  
  def redirect(object = nil)
    params[:page] = nil if params[:page].blank?
    redirect_to object.nil? ?
      admin_secrets_url(:page => params[:page]) :
      admin_secret_url(:id => object, :page => params[:page])
  end

end
