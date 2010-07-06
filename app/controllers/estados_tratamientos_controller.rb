class EstadosTratamientosController < ApplicationController
  # GET /estados_tratamientos
  # GET /estados_tratamientos.xml
  layout 'default'
  def index
    @estados_tratamientos = EstadoTratamiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estados_tratamientos }
    end
  end

  # GET /estados_tratamientos/1
  # GET /estados_tratamientos/1.xml
  def show
    @estado_tratamiento = EstadoTratamiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estado_tratamiento }
    end
  end

  # GET /estados_tratamientos/new
  # GET /estados_tratamientos/new.xml
  def new
    @estado_tratamiento = EstadoTratamiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estado_tratamiento }
    end
  end

  # GET /estados_tratamientos/1/edit
  def edit
    @estado_tratamiento = EstadoTratamiento.find(params[:id])
  end

  # POST /estados_tratamientos
  # POST /estados_tratamientos.xml
  def create
    @estado_tratamiento = EstadoTratamiento.new(params[:estado_tratamiento])

    respond_to do |format|
      if @estado_tratamiento.save
        flash[:notice] = 'Estado Tratamiento creado.'
        format.html { redirect_to(@estado_tratamiento) }
        format.xml  { render :xml => @estado_tratamiento, :status => :created, :location => @estado_tratamiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estado_tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estados_tratamientos/1
  # PUT /estados_tratamientos/1.xml
  def update
    @estado_tratamiento = EstadoTratamiento.find(params[:id])

    respond_to do |format|
      if @estado_tratamiento.update_attributes(params[:estado_tratamiento])
        flash[:notice] = 'EstadoTratamiento actualizado.'
        format.html { redirect_to(@estado_tratamiento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estado_tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estados_tratamientos/1
  # DELETE /estados_tratamientos/1.xml
  def destroy
    @estado_tratamiento = EstadoTratamiento.find(params[:id])
    @estado_tratamiento.destroy

    respond_to do |format|
      format.html { redirect_to(estados_tratamientos_url) }
      format.xml  { head :ok }
    end
  end
end
