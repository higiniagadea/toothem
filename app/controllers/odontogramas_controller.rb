class OdontogramasController < ApplicationController  

  layout 'default'
  before_filter  :generar_submenus
  before_filter :login_required



  def duplicar
   
    @odontograma = Odontograma.find(:first).clone.save

      respond_to do |format|
       format.html{redirect_to search_pacientes_path, :layout => 'default'}
       flash[:notice] = 'Odontograma Duplicado'
 
    end
  end

def index  
  @odontogramas = Odontograma.find(:all, :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'fecha_creacion ASC', :include => 'dientes')
  respond_to do |format|
     format.html{ render :layout => false}
    end
  end

  def show
   @odontograma = Odontograma.find(params[:id])
   respond_to do |format|


      format.html{ render  :layout => false }
    end
  end

  
  def new
  @paciente = Paciente.find(params[:paciente_id])
    @odontograma = Odontograma.new
  

    respond_to do |format|

      format.html{ render :layout=> false }
    end
  end

  
  def create  
    @ult_odontograma = Odontograma.find(:last)
    
    params[:odontograma][:ultimo] = true

    @odontograma = Odontograma.new(params[:odontograma])


    #if @odontograma.save
      aux=false
      params[:odonto].each do |numero_diente, cara|
        @diente = Diente.new
        
        @diente.numero_diente = numero_diente

        #caras => [superior,izquierdo,derecho,inferior,centro]
        caras = cara.split(',')
        @diente.superior = caras[0]
        @diente.izquierda = caras[1]
        @diente.derecho = caras[2]
        @diente.inferior = caras[3]
        @diente.centro = caras[4]
        @odontograma.dientes << @diente
        @diente.save
        unless @diente.superior.blank? & @diente.izquierda.blank? && @diente.derecho.blank? && @diente.inferior.blank? && @diente.centro.blank?
          aux = true
        end
        
       end

     @ult_odontograma.update_attribute(:ultimo, false)
     @ult_odontograma.save
    respond_to do |format|
      if aux == true
          @odontograma.save

          flash[:notice] = 'Odontograma Creado'
      else
        flash[:error] = 'Seleccione al menos un diente'
      end
          format.html { redirect_to search_pacientes_url}
         
    end
  

  end

  def destroy
    @odontograma = Odontograma.find(params[:id])
    @odontograma.destroy
    respond_to do |format|       
        flash[:notice] = 'Odontograma eliminado.'
     
      format.html { redirect_to search_pacientes_path }

    end
  end


  
end
