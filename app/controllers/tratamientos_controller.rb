class TratamientosController < ApplicationController
  # GET /tratamientos
  # GET /tratamientos.xml
  layout 'default'

  before_filter :login_required

  def index   
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'fecha ASC'
    respond_to do |format|     
     format.html
    end
  end

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
    @tratamiento = Tratamiento.new
    @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
    
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
      if @tratamiento.save
        flash[:notice] = 'Tratamiento creado.'
        format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos' }    
      else
        format.html {render :partial => 'new', :layout => 'default'}
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }

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
        format.xml  { render :xml => @tratamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tratamientos/1
  # DELETE /tratamientos/1.xml
  def eliminar   
    @tratamiento = Tratamiento.find(params[:id])    
    @paciente = Paciente.find(params[:paciente_id])
    
    if @tratamiento.fue_liquidado == false 
      flash[:notice] = 'El tratamiento no puede ser borrado ya que no fue liquidado'
    else
      @tratamiento.destroy
      flash[:notice] = 'Tratamiento eliminado'
    end
    respond_to do |format|   
     format.html { redirect_to edit_paciente_path(@paciente) + '#tratamientos'}
     
    end
  end

def buscar
  #@tratamiento = Tratamiento.new
  #@paciente = Paciente.find(params[:paciente_id])
    respond_to do |format|
      format.html {render :layout=> false}

    end
  end

#def resultado
 # @tratamientos = Tratamiento.find(:all, :conditions => ['fecha > ? and fecha < ?', params[:tratamiento][:fecha].to_date, params[:tratamiento][:fecha_hasta].to_date] )
  #respond_to do |format|
    #unless
     # params[:profesional].blank? && params[:fecha].blank?
      #  format.html{render :text => "Ingrese", :layout => false }
      #else
       # @tratamientos = Tratamiento.find(:all, :conditions => ['fecha > ? and fecha < ?', params[:tratamiento][:fecha].to_date, params[:tratamiento][:fecha_hasta].to_date] )
        # @tratamientos = Tratamiento.basic_search(params)
        #format.html {render :layout => false}
      
      
   #    format.html {render :layout => false}
 #end
#end

def resultado 
 @profesionales = Profesional.find( params[:profesional][:profesional_id]) if params[:profesional][:profesional_id]
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
  @tratamientos = Tratamiento.paginate :page=> params[:page], :per_page=> 10,  :order => 'fecha ASC'
  
  end
  
end


#def verificar_longitud
#@tratamiento = Tratamiento.find(:first, :conditions => {:diente => params[:tratamiento][:diente]})
   #respond_to do |format|
    #format.json { render :json => !@tratamiento}
   #end
#end



end
