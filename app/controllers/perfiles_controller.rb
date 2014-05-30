class PerfilesController < ApplicationController
  # GET /perfiles
  # GET /perfiles.xml
  layout 'default'
#before_filter :login_required
  def index
   @perfiles = Perfil.paginate :page=> params[:page], :per_page=>10, :order=> 'nombre ASC'
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @perfiles }
    end
  end

  # GET /perfiles/1
  # GET /perfiles/1.xml
  def show
    @perfil = Perfil.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @perfil }
    end
  end

  # GET /perfiles/new
  # GET /perfiles/new.xml
  def new
    @perfil = Perfil.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @perfil }
    end
  end

  # GET /perfiles/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
    @items = Item.all
   
  end

  # POST /perfiles
  # POST /perfiles.xml
  def create
    
    @perfil = Perfil.new(params[:perfil])

    respond_to do |format|
      if @perfil.save
        flash[:notice] = 'Perfil creado.'
        format.html { redirect_to(@perfil) }
        format.xml  { render :xml => @perfil, :status => :created, :location => @perfil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /perfiles/1
  # PUT /perfiles/1.xml
  def update

    @perfil = Perfil.find(params[:id])
    params[:perfil][:estatico]
  
    respond_to do |format|

      if @perfil.update_attributes(params[:perfil_id])
        flash[:notice] = 'Perfil actualizado.'
        format.html { redirect_to(@perfil) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /perfiles/1
  # DELETE /perfiles/1.xml
  def destroy
    @perfil = Perfil.find(params[:id])

    if @perfil.estatico == true
      flash[:notice] = 'El item no puede ser borrado, ya que es estatico'
    else
    @perfil.destroy
    end
    respond_to do |format|
      format.html { redirect_to(perfiles_url) }
      format.xml  { head :ok }
    end
  end
end
