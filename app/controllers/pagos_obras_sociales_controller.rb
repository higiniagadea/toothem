class PagosObrasSocialesController < ApplicationController

  layout 'default'

 before_filter :login_required
 
  def index
   @pagos_obras_sociales = PagoObraSocial.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['obra_social_id = ?', params[:obra_social][:obra_social_id]])
    respond_to do |format|
       format.html{render :layout => false}
  end

  end



  def new
    @obra_social = ObraSocial.find(params[:obra_social_id])
     @pago_obra_social = PagoObraSocial.new
   

    respond_to do |format|
    format.html { render :layout => false, :partial => 'new'}
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
        format.html { redirect_to buscar_cta_pagos_obras_sociales_path}

     else
        format.html { render :action => "edit" }

      end
    end
end

def create
    
    @pago_obra_social = PagoObraSocial.new(params[:pago_obra_social])
    @obra_social = ObraSocial.find(params[:pago_obra_social][:obra_social_id])
     respond_to do |format|
      if @pago_obra_social.save
       format.html {redirect_to buscar_cta_pagos_obras_sociales_path}
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
      format.html { redirect_to buscar_cta_pagos_obras_sociales_path}

    end
  end


def buscar_cta
  respond_to do |format|
       format.html
      end
end


def result_cta

    respond_to do |format|

      if params[:flag] == "t"
        
         @t = Tratamiento.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['obra_social_id = ? and estado_tratamiento_id = ?',  params[:obra_social][:obra_social_id] , 5 ])
       format.html{render :partial => 't'}
    elsif params[:flag] == "p"

        @pag_os = PagoObraSocial.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['obra_social_id = ?', params[:obra_social][:obra_social_id]])
       format.html{render :partial => 'pag_os'}
    else

       @t = Tratamiento.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['obra_social_id = ? and estado_tratamiento_id = ?',  params[:obra_social][:obra_social_id] , 5 ])
       @pag_os = PagoObraSocial.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['obra_social_id = ?', params[:obra_social][:obra_social_id]])
       format.html{render :layout => false}

    end
       @sald_os = ActiveRecord::Base.connection.execute('select ver_saldo_os(' + params[:obra_social][:obra_social_id] + ') ')

    end
end



end

