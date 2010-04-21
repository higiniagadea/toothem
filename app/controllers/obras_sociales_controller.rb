class ObrasSocialesController < ApplicationController
  # GET /obras_sociales
  # GET /obras_sociales.xml

  layout 'default'

  def index
    @obras_sociales = ObraSocial.all
    @pagetitle = "Obras sociales"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @obras_sociales }
    end
  end

  # GET /obras_sociales/1
  # GET /obras_sociales/1.xml
  def show
    @obra_social = ObraSocial.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @obra_social }
    end
  end

  # GET /obras_sociales/new
  # GET /obras_sociales/new.xml
  def new
    @obra_social = ObraSocial.new
    @pagetitle = "Nueva obra social"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @obra_social }
    end
  end

  # GET /obras_sociales/1/edit
  def edit
    @obra_social = ObraSocial.find(params[:id])
    @pagetitle = "Editar obra social"
  end

  # POST /obras_sociales
  # POST /obras_sociales.xml
  def create
    @obra_social = ObraSocial.new(params[:obra_social])
    @pagetitle = "Nueva obra social"
    respond_to do |format|
      if @obra_social.save
        flash[:notice] = 'Obra Social creada.'
        format.html { redirect_to(@obra_social) }
        format.xml  { render :xml => @obra_social, :status => :created, :location => @obra_social }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @obra_social.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /obras_sociales/1
  # PUT /obras_sociales/1.xml
  def update
    @obra_social = ObraSocial.find(params[:id])
    @pagetitle = "Editar obra social"
    respond_to do |format|
      if @obra_social.update_attributes(params[:obra_social])
        flash[:notice] = 'Obra Social actualizada'
        format.html { redirect_to(@obra_social) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @obra_social.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /obras_sociales/1
  # DELETE /obras_sociales/1.xml
  def destroy
    @obra_social = ObraSocial.find(params[:id])
    @obra_social.destroy

    respond_to do |format|
      flash[:notice] = 'Obra Social eliminada'
      format.html { redirect_to(obras_sociales_url) }
      format.xml  { head :ok }
    end
  end
  def buscar
    @pagetitle = "Buscar obra social"
    respond_to do |format|
      format.html # buscar.html.erb

    end
  end
  def resultado
    respond_to do |format|
      if params[:nombre].blank? && params[:auditoria_previa].blank? && params[:auditoria_post].blank? && params[:incluye_ficha].blank?
        format.html{render :text => "debe ingresar al menos un parametro", :layout => false }
      else
        @obras_sociales = ObraSocial.basic_search(params)
        format.html {render :layout => false}
      end
        
      
    end
    
    
    
  end
end
