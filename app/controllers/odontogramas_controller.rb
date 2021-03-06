class OdontogramasController < ApplicationController  

  layout 'default'
  before_filter  :generar_submenus
  before_filter :login_required

def lista
   @paciente = Paciente.find(params[:id])
 

  respond_to do |format|
     @odonto = Odontograma.paginate(:page => params[:page], :per_page => 12,:conditions => ['paciente_id = ?', @paciente.id.to_s])
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
    @paciente = Paciente.find(params[:odontograma][:paciente_id])
    @odontograma = Odontograma.new(params[:odontograma])
    
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
          flash[:notice] = 'Odontograma guardado'
      else
        flash[:error] = 'Seleccione al menos un diente'
      end
          format.html {redirect_to edit_paciente_path(@paciente) + '#odontogramas'}
        
    end
 
  end

  def eliminar
    @odontograma = Odontograma.find(params[:id])
    @paciente = Paciente.find(params[:paciente_id])
    @odontograma.destroy

    respond_to do |format|
        flash[:notice] = 'Odontograma eliminado.'
     
      format.html {redirect_to edit_paciente_path(@paciente) + '#odontogramas'}

    end
  end

  def edit     
    @odontograma = Odontograma.find(params[:id])
    respond_to do |format|
    format.html {render :layout => false}
   end
  end
 

   def duplicar
    @paciente = Paciente.find(params[:paciente_id])
    @odontograma = Odontograma.find(:first, :include => 'dientes').clone
      respond_to do |format|
      if  @odontograma.save
        flash[:notice] = 'Odontograma Duplicado'
       format.html{redirect_to edit_paciente_path(@paciente) + '#odontogramas'}
    end
  end
  end

def update
   @odontograma =Odontograma.find(params[:id])

    params[:odontograma][:ultimo] = true
 
   
  
      params[:odonto].each do |numero_diente, cara|
        @diente = Diente.new
        @diente.numero_diente = numero_diente
        #cara => [superior,izquierdo,derecho,inferior,centro] #esto descomente
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

       respond_to do |format|
        
       if  @odontograma.update_attributes(params[:odontograma])
          flash[:notice] = 'Odontograma Actualizado'
      else
        flash[:error] = 'Seleccione al menos un diente'
      end
      format.html {redirect_to search_pacientes_path}
          format.html {redirect_to edit_paciente_path(@odontograma.paciente_id) + '#odontogramas'}

    end

end
 

  end




        