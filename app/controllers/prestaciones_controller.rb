class PrestacionesController < ApplicationController
  # GET /prestaciones
  # GET /prestaciones.xml
  layout 'default'

  def index
    @prestaciones = Prestacion.all
    @pagetitle = "Prestaciones"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prestaciones }
    end
  end

  # GET /prestaciones/1
  # GET /prestaciones/1.xml
  def show
    @prestacion = Prestacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prestacion }
    end
  end

  # GET /prestaciones/new
  # GET /prestaciones/new.xml
  def new
    @prestacion = Prestacion.new
    @pagetitle = "Nueva prestación"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prestacion }
    end
  end

  # GET /prestaciones/1/edit
  def edit
    @prestacion = Prestacion.find(params[:id])
    @pagetitle = "Editando prestación"
  end

  # POST /prestaciones
  # POST /prestaciones.xml
  def create
    @prestacion = Prestacion.new(params[:prestacion])
    @pagetitle = "Nueva prestación"
    respond_to do |format|
      if @prestacion.save
        flash[:notice] = 'Prestacion creada.'
        format.html { redirect_to(@prestacion) }
        format.xml  { render :xml => @prestacion, :status => :created, :location => @prestacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prestacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prestaciones/1
  # PUT /prestaciones/1.xml
  def update
    @prestacion = Prestacion.find(params[:id])
    @pagetitle = "Editando prestación"
    respond_to do |format|
      if @prestacion.update_attributes(params[:prestacion])
        flash[:notice] = 'Prestacion actualizada'
        format.html { redirect_to(@prestacion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prestacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prestaciones/1
  # DELETE /prestaciones/1.xml
  def destroy
    @prestacion = Prestacion.find(params[:id])
    @prestacion.destroy

    respond_to do |format|
      format.html { redirect_to(prestaciones_url) }
      format.xml  { head :ok }
    end
  end
end
