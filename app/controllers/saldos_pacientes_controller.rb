class SaldosPacientesController < ApplicationController
layout 'default'
 before_filter :login_required
  def orden
     @paciente = Paciente.find(params[:id])

    respond_to do |format|
       @saldos_pacientes = SaldoPaciente.paginate :page=> params[:page], :per_page=> 1, :conditions => ['paciente_id = ?', @paciente.id]
       format.html{render :partial => 'orden'}
    end
  end

 #def show
  #  @pago_paciente = PagoPaciente.find(params[:id])
   # respond_to do |format|

    #  format.html { render :layout => 'default' }
    #end
  #end

  def new
   @saldo_paciente = SaldoPaciente.new
   @paciente = Paciente.find(params[:paciente_id])

    respond_to do |format|
      format.html { render :layout => false, :partial => 'new'}
    end
end

def edit
   if params[:saldo_paciente_id]
      @saldo_paciente = SaldoPaciente.find(params[:saldo_paciente_id])
    end
    if params[:paciente_id]
      @paciente = Paciente.find(params[:paciente_id])
    end
    @saldo_paciente = SaldoPaciente.find(params[:id])

     respond_to do |format|
      format.html{render :layout => false}

    end
end

def update
   @saldo_paciente = SaldoPaciente.find(params[:id])
   @paciente = Paciente.find(params[:saldo_paciente][:paciente_id])
    respond_to do |format|
      if @saldo_paciente.update_attributes(params[:saldo_paciente])

        flash[:notice] = 'Actualizado'
        format.html { redirect_to edit_paciente_path(@paciente) + '#cuenta_cte'}

     else
        format.html { render :action => "edit" }

      end
    end
end

def create
    @paciente = Paciente.find(params[:saldo_paciente][:paciente_id])
    @saldo_paciente = SaldoPaciente.new(params[:saldo_paciente])
    #@pagos_pacientes = PagoPaciente.paginate :page=> params[:page], :per_page=> 5,  :conditions => ['paciente_id = ?', @paciente.id]
     respond_to do |format|
      if @saldo_paciente.save
       format.html {redirect_to edit_paciente_path(@paciente) + '#cuenta_cte'}
       flash[:notice] = 'Pago realizado'
      else
         format.html { render :action => "new" }

     end
    end
end

def destroy

    @saldo_paciente = SaldoPaciente.find(params[:id])
    @paciente = Paciente.find(params[:paciente_id])
    @saldo_paciente.destroy
    respond_to do |format|
      flash[:notice] = 'Saldo eliminado'
      format.html { redirect_to edit_paciente_path(@paciente) + '#cuenta_cte' }

    end
  end


end
