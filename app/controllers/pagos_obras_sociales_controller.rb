class PagosObrasSocialesController < ApplicationController
layout 'default'
 #before_filter :login_required
 
  def index
   @obras_sociales = ObraSocial.find(params[:obra_social_id])
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
    @obra_social = ObraSocial.find(params[:obra_social_id])
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
   @obra_social = ObraSocial.find(params[:pago_obra_social][:obra_social_id])
    respond_to do |format|
      if @pago_obra_social.update_attributes(params[:pago_obra_social])

        flash[:notice] = 'Actualizado'
        format.html { redirect_to buscar_cta_cte_path}

     else
        format.html { render :action => "edit" }

      end
    end
end

def create
    @obra_social = ObraSocial.find(params[:pago_obra_social][:obra_social_id])
    @pago_obra_social = PagoObraSocial.new(params[:pago_obra_social])
    #@pagos_pacientes = PagoPaciente.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
     respond_to do |format|
      if @pago_obra_social.save
       format.html {redirect_to buscar_cta_cte_path}
       flash[:notice] = 'Pago realizado'
      else
         format.html { render :action => "new" }

     end
    end
end

def destroy

    @pago_obra_social = PagoObraSocial.find(params[:id])
    @obra_social = ObraSocial.find(params[:obra_social_id])
    @pago_obra_social.destroy
    respond_to do |format|
      flash[:notice] = 'Pago eliminado'
      format.html { redirect_to buscar_cta_cte_path}

    end
  end


end

