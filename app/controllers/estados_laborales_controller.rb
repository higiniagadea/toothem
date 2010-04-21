class EstadosLaboralesController < ApplicationController
  # GET /estados_laborales
  # GET /estados_laborales.xml

  layout 'default'

  def index
    @pagetitle = "Estados laborales"
    @estados_laborales = EstadoLaboral.paginate :page=> params[:page], :per_page=>15

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estados_laborales }
    end
  end

 
  # GET /estados_laborales/new
  # GET /estados_laborales/new.xml
  def new
    @pagetitle = "Nuevo Estado laboral"
    @estado_laboral = EstadoLaboral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estado_laboral }
    end
  end

  # GET /estados_laborales/1/edit
  def edit
    @pagetitle = "Editar Estado laboral"
    @estado_laboral = EstadoLaboral.find(params[:id])
  end

  # POST /estados_laborales
  # POST /estados_laborales.xml
  def create
    @pagetitle = "Nuevo Estado laboral"
    @estado_laboral = EstadoLaboral.new(params[:estado_laboral])

    respond_to do |format|
      if @estado_laboral.save
        flash[:notice] = 'Estado Laboral creado.'
        format.html { redirect_to(estados_laborales_url) }
        format.xml  { render :xml => @estado_laboral, :status => :created, :location => @estado_laboral }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estado_laboral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estados_laborales/1
  # PUT /estados_laborales/1.xml
  def update
    @pagetitle = "Editar Estado laboral"
    @estado_laboral = EstadoLaboral.find(params[:id])

    respond_to do |format|
      if @estado_laboral.update_attributes(params[:estado_laboral])
        flash[:notice] = 'Estado Laboral actualizado.'
        format.html { redirect_to(estados_laborales_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estado_laboral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estados_laborales/1
  # DELETE /estados_laborales/1.xml
  def destroy
    @estado_laboral = EstadoLaboral.find(params[:id])
    @profesional = Profesional.find_by_estado_laboral_id(@estado_laboral)

    if @profesional.blank?
      flash[:notice] = 'Estado Laboral borrado.'
      @estado_laboral.destroy
    else
      flash[:error] = 'Imposible eliminar el estado laboral ya que posee profesionales asociados.'
    end

    

    respond_to do |format|
      format.html { redirect_to(estados_laborales_url) }
      format.xml  { head :ok }
    end
  end
end
