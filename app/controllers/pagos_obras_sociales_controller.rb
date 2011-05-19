class PagosObrasSocialesController < ApplicationController

  layout 'default'

 before_filter :login_required
 
  def index
 
    @pagos_obras_sociales = PagoObraSocial.find(:all)
 
    respond_to do |format|
       format.html
  end

  end


 #def show
  #  @pago_obra_social = PagoObraSocial.find(params[:id])
   # respond_to do |format|

    #  format.html { render :layout => 'default' }
    #end
  #end

  def new
     @pago_obra_social = PagoObraSocial.new
   

    respond_to do |format|
      format.html { render :layout => false}
    end
end

def edit

    @pago_obra_social = PagoObraSocial.find(params[:id])

     respond_to do |format|
      format.html{render :layout => false}

    end
end

def update
   @pago_obra_social = PagoObraSocial.find(params[:id])
  
    respond_to do |format|
      if @pago_obra_social.update_attributes(params[:pago_obra_social])

        flash[:notice] = 'Pago Actualizado'
        format.html { redirect_to pagos_obras_sociales_path}

     else
        format.html { render :action => "edit" }

      end
    end
end

def create
    
    @pago_obra_social = PagoObraSocial.new(params[:pago_obra_social])
  
     respond_to do |format|
      if @pago_obra_social.save
       format.html {redirect_to pagos_obras_sociales_path}
       flash[:notice] = 'Pago realizado'
      else
         format.html { render :action => "new" }

     end
    end
end

def destroy

    @pago_obra_social = PagoObraSocial.find(params[:id])
   
    @pago_obra_social.destroy
    respond_to do |format|
      flash[:notice] = 'Pago eliminado'
      format.html { redirect_to pagos_obras_sociales_path}

    end
  end


def mostrar_lista

  respond_to do |format|

    @tratamientos = Tratamiento.find(:all)
   format.html {render :partial => 'mostar_lista', :layout => false}
  end
end

end

