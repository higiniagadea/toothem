class TratamientosController < ApplicationController
  # GET /tratamientos
  # GET /tratamientos.xml
  layout 'default'

  before_filter :login_required

  def index
  
    
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5
    respond_to do |format|
      #format.html {render :partial => 'edit', :layout=> 'default'}
     format.html
    end
  end

  # GET /tratamientos/1
  # GET /tratamientos/1.xml
  def show
  #@paciente = Paciente.find_by_id(params[:id])
  @tratamiento = Tratamiento.find(params[:id])
  #@tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
    respond_to do |format|
       format.html{render :layout => false}
     
    end
  end

  # GET /tratamientos/new
  # GET /tratamientos/new.xml
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @tratamiento = Tratamiento.new
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
    #@ficha = Ficha.new(params[:ficha_id]) unless params[:ficha_id].blank?
    respond_to do |format|
      format.html { render :partial => 'new', :layout => 'default' }
      #format.xml  { render :xml => @tratamiento }
    end
  end

   #def new_trat
    #@paciente = Paciente.find(params[:paciente_id])
    #@tratamiento = Tratamiento.new
    #@tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
    #@ficha = Ficha.new(params[:ficha_id]) unless params[:ficha_id].blank?
    #respond_to do |format|
     #format.html { render :partial => 'new_trat', :layout => 'default'}
      #format.xml  { render :partial=> 'pacientes/edit_tratamientos' }
    #end
  #end


  # GET /tratamientos/1/edit
  def edit
    if params[:paciente_id]
      @paciente = Paciente.find(params[:paciente_id])
    end
    @tratamiento = Tratamiento.find(params[:id])
    respond_to do |format|
      format.html{render :layout => false}

    end
  end

  # POST /tratamientos
  # POST /tratamientos.xml
  def create
    @paciente = Paciente.find(params[:tratamiento][:paciente_id])
    @tratamiento = Tratamiento.new(params[:tratamiento])
    @tratamientos = Tratamiento.paginate(:page=> params[:page], :per_page=> 5, :conditions => ['paciente_id = ?', @paciente.id.to_s])
    #@ficha = Ficha.new(params[:ficha_id]) unless params[:ficha_id].blank?
    respond_to do |format|
      if @tratamiento.save
        flash[:notice] = 'Tratamiento creado.'
        format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }
        #format.html {redirect_to pacientes_path(@paciente) }
    
      else
        format.html {render :partial => 'new', :layout => 'default'}
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }

      end
    end
  end

  

  # PUT /tratamientos/1
  # PUT /tratamientos/1.xml
  def update
   @paciente = Paciente.find(params[:tratamiento][:paciente_id])
   @tratamiento = Tratamiento.find(params[:id])
   
    
    respond_to do |format|
      if @tratamiento.update_attributes(params[:tratamiento])
        flash[:notice] = 'Tratamiento actualizado.'
      #  format.html {render :partial=> 'pacientes/edit_tratamientos', :layout=> 'default'}
      #format.html { redirect_to @tratamiento}
       format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tratamientos/1
  # DELETE /tratamientos/1.xml
  def eliminar
    #@paciente = Paciente.find(params[:id])
    @tratamiento = Tratamiento.find(params[:id])
    @tratamiento.destroy
    @paciente = Paciente.find(params[:paciente_id])
    respond_to do |format|
      flash[:notice] = 'Tratamiento eliminado'
     #format.html {redirect_to search_pacientes_url}
     format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos'}
     
    end
  end
end
