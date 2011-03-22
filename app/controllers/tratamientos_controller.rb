class TratamientosController < ApplicationController
  # GET /tratamientos
  # GET /tratamientos.xml
  layout 'default'

  before_filter :login_required

  def index   
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 10,  :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'fecha ASC'
    respond_to do |format|     
     format.html
    end
  end

  #muestra el importe dependiendo del arancel
  def actualizar_importe
    @arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
 respond_to do |format| 
 format.html {
   render :update do |page|
     if @arancel.blank?
       page['actualizar_importe'].replace_html '-'
     else
       page['actualizar_importe'].replace_html @arancel.importe_cubierto
      
     end
          
   end
   }
    end
  end

  #muestra el coseguro dependiendo del arancel
  def actualizar_coseguro
    @arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
 respond_to do |format|
 format.html {
   render :update do |page|
     if @arancel.blank?
       page['actualizar_coseguro'].replace_html '-'
     else
       page['actualizar_coseguro'].replace_html @arancel.coseguro

     end

   end
   }
    end
  end



  # GET /tratamientos/1
  # GET /tratamientos/1.xml
  def show  
  @tratamiento = Tratamiento.find(params[:id]) 
    
    respond_to do |format|
       format.html{render :layout => false}
    end
  end

  # GET /tratamientos/new
  # GET /tratamientos/new.xml
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @obra_social = ObraSocial.find(params[:obra_social_id]) unless params[:obra_social_id].blank?
    @tratamiento = Tratamiento.new
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
   
    @arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
    respond_to do |format|
      format.html { render :layout => false , :partial => 'new'}
      
    end
  end 


  # GET /tratamientos/1/edit
  def edit
    if params[:ficha_id]
      @ficha = Ficha.find(params[:ficha_id])
    end
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
    @arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
     
    @tratamiento = Tratamiento.new(params[:tratamiento])
    #arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
    #params[:tratamiento][:importe_cubierto] = arancel.importe_cubierto.to_i
    #params[:tratamiento][:coseguro] = arancel.coseguro.to_i

    @tratamientos = Tratamiento.paginate(:page=> params[:page], :per_page=> 5, :conditions => ['paciente_id = ?', @paciente.id.to_s])
   
    respond_to do |format|
      if  @tratamiento.save
        flash[:notice] = 'Tratamiento creado.'
        format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }    
      else
        format.html {render :partial => 'new', :layout => 'default'}
      end
    end
  end

  

  # PUT /tratamientos/1
  # PUT /tratamientos/1.xml
  def update   
   @tratamiento = Tratamiento.find(params[:id])
   @paciente = Paciente.find(params[:tratamiento][:paciente_id])
   respond_to do |format|
      if @tratamiento.update_attributes(params[:tratamiento])
       flash[:notice] = 'Tratamiento actualizado.'
       format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }
      else
          format.html { render :action => "edit" }
        
      end
    end
  end

 
  def eliminar   
    @tratamiento = Tratamiento.find(params[:id])    
    @paciente = Paciente.find(params[:paciente_id])
    
    if @tratamiento.fue_liquidado == true
      flash[:notice] = 'El tratamiento no puede ser borrado ya que no fue liquidado'
    else
      @tratamiento.destroy
      flash[:notice] = 'tratamiento liquidado'
    end
    respond_to do |format|   
     format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos'}
     
    end
  end

def buscar
      respond_to do |format|
      format.html {render :layout=> false}

    end
  end


def resultado 
 @profesionales = Profesional.find(params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
  params[:tratamiento][:profesional_id] = params[:profesional][:profesional_id] if params[:profesional][:profesional_id]
  respond_to do |format|
      params[:tratamiento][:profesional_id] =  @profesionales.id
      if params[:profesional][:profesional_id].blank? && params[:fecha].blank?
        format.html{render :text => "Ingrese los datos para realizar la busqueda", :layout => false }
      else
       @tratamientos = Tratamiento.busqueda(params[:tratamiento])
        format.html {render :partial => 'resultado', :layout => false } 
      end
  end
end


def imprimir   
  @tratamiento = Tratamiento.find(params[:id])
  respond_to do |format|
   format.html {render :partial => 'reporte'}
  end
end


def ver
  @tratamiento = Tratamiento.find(params[:id])
  respond_to do |format|
    format.html{ render :layout=> false, :partial => 'ver'}
   end
end

def imprimir
    @tratamiento = Tratamiento.find(params[:id])
    respond_to do |format|
      format.html {render :partial=> 'imprimir', :layout=> 'print'}
    end
end


def listados
  @paciente = Paciente.find(params[:id])

respond_to do |format|
  format.html {render :partial => 'listados', :layout=> false }
  @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 10, :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'fecha ASC' 
  
  end
  
end

end
