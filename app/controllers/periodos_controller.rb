 class PeriodosController < ApplicationController

  layout 'default'


def liquidar
  #@periodos = Periodo.find(:all, :order => 'mes DESC', :conditions => ['fue_liquidado = ?', false])
 
  respond_to do |format|
      format.html
    end
end

def resultado_liq
  
  respond_to do |format|    
    unless params[:periodo][:periodo_id].blank?
 flash[:notice] = 'Per&iacute;odo Liquidado, el resultado es: '
  @resultado =  Periodo.find_by_sql('select actualizar_cta_paciente(' + params[:periodo][:periodo_id].to_s + ') as liquidado '  )
         
      format.html {render :partial => 'resultado_liq'}
    else
      format.html{render :text => '<span style="color:red"> Seleccione el periodo para liquidar </span>'}
  end
  #Periodo.find_by_sql('select actualizar_cta_paciente(7)')
end
end


  def index
   
      @periodos = Periodo.paginate(:page=> params[:page], :per_page=> 12, :order => 'mes DESC', :conditions => ['fue_liquidado = ?', false])

    respond_to do |format|
     format.html
      
    end
  end
  
  def new
     @periodo = Periodo.new

     respond_to do |format|
      format.html{render :partial => 'new', :layout => 'default'}
     end
  end

  def create
     @periodo = Periodo.new(params[:periodo])

    respond_to do |format|
      
       if @periodo.save
        flash[:notice] = 'Per&iacute;odo Guardado'
        format.html { redirect_to buscar_periodos_path}    
       else
          format.html { render :partial => 'new', :layout => 'default' }
      end
    end
 
  end

  def edit
    @periodo = Periodo.find(params[:id])

    respond_to do |format|
      format.html {render :layout => false}
    end
  end

   def update
    @periodo = Periodo.find(params[:id])

    respond_to do |format|
      if @periodo.update_attributes(params[:periodo])
        flash[:notice] = 'Per&iacute;odo actualizado'
        format.html { redirect_to buscar_periodos_path }

      else
        format.html { render :action => "edit" }

      end
    end
  end

  def buscar
    respond_to do |format|
      format.html
    end
  end

  #def resultado
  #  respond_to do |format|
   #   if params[:periodo][:mes].blank?
    #    format.html{render :text => "Seleccione un Año para realizar la busqueda " }
     # elsif
      #   format.html{render :partial=> 'resultado', :layout => false }

       # @periodos = Periodo.buscar(params[:mes])
      #end
    #end
  #end

  def resultado
    respond_to do |format|     
    params[:mes] = params[:periodo]['mes(1i)'.to_sym]
    
        @periodos = Periodo.buscar(params[:mes]).paginate :page=> params[:page], :per_page=> 12 , :order => 'mes DESC'
        format.html {render :partial => 'resultado'}
  
  end
  end
 

   def destroy
   @periodo = Periodo.find_by_id(params[:id])

    if @periodo.fue_liquidado == true
      flash[:notice] = 'El per&iacute;odo no puede ser borrado ya que no fue liquidado'
    else
      @periodo.destroy
      flash[:notice] = 'Per&iacute;odo eliminado'
    end
   respond_to do |format|
      
     format.html{redirect_to buscar_periodos_path}
   end

  end

end
