class OdontogramasController < ApplicationController  

  layout 'default'
  before_filter  :generar_submenus
  before_filter :login_required

def index
 
  @odontogramas = Odontograma.find(:all)
  respond_to do |format|
     format.html{ render :layout => false}
    end
  end

  def show
  @odontograma = Odontograma.find(params[:id])
    respond_to do |format|

      format.html{ render :layout => 'default'}
    end
  end

  
  def new
  @paciente = Paciente.find(params[:paciente_id])
    @odontograma = Odontograma.new

    respond_to do |format|

      format.html{ render :layout=> false }
    end
  end

 
  def edit
    @odontograma = Odontograma.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end

  
  def create
    
    @odontograma = Odontograma.new(params[:odontograma])
    if @odontograma.save
    
      params[:odonto].each do |numero_diente, cara|
        @diente = Diente.new
        @diente.odontograma_id = @odontograma.id
        @diente.numero_diente = numero_diente

        #caras => [superior,izquierdo,derecho,inferior,centro]
        caras = cara.split(',')
        @diente.superior = caras[0]
        @diente.izquierda = caras[1]
        @diente.derecho = caras[2]
        @diente.inferior = caras[3]
        @diente.centro = caras[0]
        @diente.save
      end
    respond_to do |format|
          flash[:notice] = 'Odontograma Creado'
          format.html { redirect_to(odontogramas_url)}

    end
  end
  end
 
  def update
    @odontograma = Odontograma.find(params[:id])

    respond_to do |format|
      if @odontograma.update_attributes(params[:odontograma])
        flash[:notice] = 'Odontograma actualizada.'
        format.html { redirect_to(odontogramas_url) }

      else
        format.html { render :action => "edit" }

      end
    end
  end

 
  def destroy
    @odontograma = Odontograma.find(params[:id])
    @odontograma.destroy
    respond_to do |format|       
        flash[:notice] = 'Odontograma eliminado.'
     
      format.html { redirect_to(odontogramas_url) }

    end
  end


  def ver
   @paciente = Paciente.find(params[:id])
 
   respond_to do |format|
      @diente = Diente.find(:all)
      @odontograma = @diente.odontograma.find(:all, :conditions => ['paciente_id = ?', @paciente.id.to_s])

      format.html {render :partial => 'ver'}

  end
  end

  
end
