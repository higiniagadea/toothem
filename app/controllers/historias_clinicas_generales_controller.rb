class HistoriasClinicasGeneralesController < ApplicationController
  # GET /historias_clinicas_generales
  # GET /historias_clinicas_generales.xml
  layout 'default'
  def index
    @historias_clinicas_generales = HistoriaClinicaGeneral.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @historias_clinicas_generales }
    end
  end

  # GET /historias_clinicas_generales/1
  # GET /historias_clinicas_generales/1.xml
  def show
    @historia_clinica_general = HistoriaClinicaGeneral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @historia_clinica_general }
    end
  end

  # GET /historias_clinicas_generales/new
  # GET /historias_clinicas_generales/new.xml
  def new
    @historia_clinica_general = HistoriaClinicaGeneral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @historia_clinica_general }
    end
  end

  # GET /historias_clinicas_generales/1/edit
  def edit
    @historia_clinica_general = HistoriaClinicaGeneral.find(params[:id])
  end

  # POST /historias_clinicas_generales
  # POST /historias_clinicas_generales.xml
  def create
    @historia_clinica_general = HistoriaClinicaGeneral.new(params[:historia_clinica_general])

    respond_to do |format|
      if @historia_clinica_general.save
        flash[:notice] = 'Historia Clinica General creada.'
        format.html { redirect_to(@historia_clinica_general) }
        format.xml  { render :xml => @historia_clinica_general, :status => :created, :location => @historia_clinica_general }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @historia_clinica_general.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /historias_clinicas_generales/1
  # PUT /historias_clinicas_generales/1.xml
  def update
    @historia_clinica_general = HistoriaClinicaGeneral.find(params[:id])

    respond_to do |format|
      if @historia_clinica_general.update_attributes(params[:historia_clinica_general])
        flash[:notice] = 'Historia Clinica General actualizada.'
        format.html { redirect_to(@historia_clinica_general) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @historia_clinica_general.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /historias_clinicas_generales/1
  # DELETE /historias_clinicas_generales/1.xml
  def destroy
    @historia_clinica_general = HistoriaClinicaGeneral.find(params[:id])
    @historia_clinica_general.destroy

    respond_to do |format|
      format.html { redirect_to(historias_clinicas_generales_url) }
      format.xml  { head :ok }
    end
  end
end
