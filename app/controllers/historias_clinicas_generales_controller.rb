class HistoriasClinicasGeneralesController < ApplicationController
  # GET /historias_clinicas_generales
  # GET /historias_clinicas_generales.xml
  
  before_filter(:get_paciente)
   layout 'default'
    #def index
   # @historias_clinicas_generales = HistoriaClinicaGeneral.all
    #@pagetitle = 'Historias Clinicas Generales'
    #respond_to do |format|
     # format.html # index.html.erb
      #format.xml  { render :xml => @historias_clinicas_generales }
    #end
  #end

  # GET /historias_clinicas_generales/1
  # GET /historias_clinicas_generales/1.xml
  def show
    @title = "Pacientes. Historia Clinica General"
    @historia_clinica_general = @paciente.historia_clinica_general
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @historia_clinica_general }
    end
  end
  
  def imprimir
    @historia_clinica_general = @paciente.historia_clinica_general
    @pagetitle = "Historia Clinica General de "+ @paciente.nombre
    respond_to do |format|
      format.html {render :layout=> "print", :action => "print"}   #ccs :layout=>false
      #format.xml  { render :xml => @historia_clinica_general }

    end
  end

  # GET /historias_clinicas_generales/new
  # GET /historias_clinicas_generales/new.xml
  def new
    @historia_clinica_general = HistoriaClinicaGeneral.new
  
     respond_to do |format|
     format.html#historia clinica gral
    end
  end

  # GET /historias_clinicas_generales/1/edit
  def edit

     @historia_clinica_general = HistoriaClinicaGeneral.find(params[:paciente_id])
     @pagetitle = 'Editando Historia Clinica General' 
    

  end

  # POST /historias_clinicas_generales
  # POST /historias_clinicas_generales.xml
  def create
    params[:historia_clinica_general][:paciente_id] = @paciente.id
    @historia_clinica_general = HistoriaClinicaGeneral.new(params[:historia_clinica_general])
    respond_to do |format|
      if @historia_clinica_general.save
        flash[:notice] = 'Historia Clinica General creada.'
        format.html{render :action => 'show'}
        #format.xml  { render :xml => @historia_clinica_general, :status => :created, :location => @historia_clinica_general }
     else
       format.html { render :action => "new" }
        #format.xml  { render :xml => @historia_clinica_general.errors, :status => :unprocessable_entity }
      end
    end
   end

  # PUT /historias_clinicas_generales/1
  # PUT /historias_clinicas_generales/1.xml
  def update
    @historia_clinica_general = @paciente.historia_clinica_general
    respond_to do |format|
      if @historia_clinica_general.update_attributes(params[:historia_clinica_general])
        flash[:notice] = 'Historia Clinica General actualizada.'

        format.html {redirect_to paciente_historia_clinica_general_path}
       # format.xml  { head :ok }
      #else
       # format.html { render :action => "edit" }
        #format.xml  { render :xml => @historia_clinica_general.errors, :status => :unprocessable_entity }
     
       
      else
        format.html { render :action => "edit" }
      

      
    end
   end
  end
  # DELETE /historias_clinicas_generales/1
  # DELETE /historias_clinicas_generales/1.xml
  def destroy
    @historia_clinica_general = @paciente.historias_clinicas_generales.find(params[:id])
    @historia_clinica_general.destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to new_paciente_historia_clinica_general_path }
    
    end
  end

  private

  def get_paciente
    @paciente = Paciente.find(params[:paciente_id])
  end

end
