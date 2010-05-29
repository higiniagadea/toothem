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
<<<<<<< HEAD:app/controllers/historias_clinicas_generales_controller.rb
    @historia_clinica_general = @paciente.historia_clinica_general
    @pagetitle = "Historia Clinica General de " + @paciente.nombre
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @historia_clinica_general }
=======
    @title = "Pacientes. Historia Clinica"
    @historia_clinica_general = @paciente.historia_clinica_general
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @historia_clinica_general }
    end
  end
  def imprimir
    @historia_clinica_general = @paciente.historia_clinica_general
    @pagetitle = "Historia clinica general de "+ @paciente.nombre
    respond_to do |format|
      format.html {render :layout => false, :action => "show"}
      #format.xml  { render :xml => @historia_clinica_general }
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_generales_controller.rb
    end
  end

  # GET /historias_clinicas_generales/new
  # GET /historias_clinicas_generales/new.xml
  def new
    
    #@historia_clinica_general = @paciente.historia_clinica_general.new
    @historia_clinica_general = HistoriaClinicaGeneral.new
<<<<<<< HEAD:app/controllers/historias_clinicas_generales_controller.rb
    @pagetitle = "Historia Clinica General de: " + @paciente.nombre
=======
    @title = "Nueva historia clinica general"
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_generales_controller.rb
 
    respond_to do |format|
     format.html#historia clinica gral
    end
  end

  # GET /historias_clinicas_generales/1/edit
  def edit
<<<<<<< HEAD:app/controllers/historias_clinicas_generales_controller.rb
     @historia_clinica_general = @paciente.historia_clinica_general.find(params[:paciente_id])
     @pagetitle = 'Editando Historia Clinica General' + @paciente.nombre
=======
     @historia_clinica_general = @paciente.historia_clinica_general
     @title = "Editando historia clinica general"
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_generales_controller.rb
  end

  # POST /historias_clinicas_generales
  # POST /historias_clinicas_generales.xml
  def create
    #@historia_clinica_general = @paciente.historia_clinica_general.new(params[:historia_clinica_general])
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
<<<<<<< HEAD:app/controllers/historias_clinicas_generales_controller.rb
    @historia_clinica_general = @paciente.historias_clinicas_generales.find(params[:paciente_id])
=======
    @historia_clinica_general = @paciente.historia_clinica_general
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_generales_controller.rb

    respond_to do |format|
      if @historia_clinica_general.update_attributes(params[:historia_clinica_general])
        flash[:notice] = 'Historia Clinica General actualizada.'
<<<<<<< HEAD:app/controllers/historias_clinicas_generales_controller.rb
        format.html {redirect_to @paciente}
       # format.xml  { head :ok }
      #else
       # format.html { render :action => "edit" }
        #format.xml  { render :xml => @historia_clinica_general.errors, :status => :unprocessable_entity }
=======
        format.html{redirect_to paciente_historia_clinica_general_path(@paciente)}
       
      else
        format.html { render :action => "edit" }
      
>>>>>>> 8f4a4514ce387a71d3813d507577904f18142bbc:app/controllers/historias_clinicas_generales_controller.rb
      
    end
   end
  end
  # DELETE /historias_clinicas_generales/1
  # DELETE /historias_clinicas_generales/1.xml
  def destroy
    @historia_clinica_general = @paciente.historias_clinicas_generales.find(params[:paciente_id])
    @historia_clinica_general.destroy

    respond_to do |format|
      format.html { redirect_to new_paciente_historia_clinica_general_path }
    
    end
  end

  private

  def get_paciente
    @paciente = Paciente.find(params[:paciente_id])
  end

end
