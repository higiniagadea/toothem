class PagosPacientesController < ApplicationController
layout 'default'

  def orden
     @paciente = Paciente.find(params[:id])
    
    
    respond_to do |format|
     
      format.html{render :partial => 'orden', :layout => false }
       @pagos_pacientes = PagoPaciente.paginate :page=> params[:page], :per_page=> 1, :conditions => ['paciente_id = ?', @paciente.id], :order => 'fecha DESC'
    end
  end




 def show
    @pago_paciente = PagoPaciente.find(params[:id])
    respond_to do |format|
   
      format.html { render :layout => 'default' }
    end
  end

  def new
   @paciente = Paciente.find(params[:paciente_id])
   @pago_paciente = PagoPaciente.new

    respond_to do |format|
      format.html { render :layout => false, :partial => 'new'}
    end
end

def edit
   if params[:pago_paciente_id]
      @pago_paciente = PagoPaciente.find(params[:pago_paciente_id])
    end
    if params[:paciente_id]
      @paciente = Paciente.find(params[:paciente_id])
    end
    @pago_paciente = PagoPaciente.find(params[:id])

     respond_to do |format|
      format.html{render :layout => false}

    end
end

def update
   @pago_paciente = PagoPaciente.find(params[:id])
   @paciente = Paciente.find(params[:pago_paciente][:paciente_id])
    respond_to do |format|
      if @pago_paciente.update_attributes(params[:pago_paciente])
     
        flash[:notice] = 'Actualizado'
        format.html { redirect_to edit_paciente_path(@paciente) + '#cuenta_cte'}
        
     else
        format.html { render :action => "edit" }
        
      end
    end
end

def create
    @paciente = Paciente.find(params[:pago_paciente][:paciente_id])
    @pago_paciente = PagoPaciente.new(params[:pago_paciente])
    #@pagos_pacientes = PagoPaciente.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
     respond_to do |format|
      if @pago_paciente.save
       format.html {redirect_to edit_paciente_path(@paciente) + '#cuenta_cte'}
       flash[:notice] = 'Pago realizado'
      else
         format.html { render :action => "new" }
        
     end
    end
end

def destroy
  
    @pago_paciente = PagoPaciente.find(params[:id])
    @paciente = Paciente.find(params[:paciente_id])
    @pago_paciente.destroy
    respond_to do |format|
      flash[:notice] = 'Pago eliminado'
      format.html { redirect_to edit_paciente_path(@paciente) + '#cuenta_cte' }

    end
  end


end
