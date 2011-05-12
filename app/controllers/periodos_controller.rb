 class PeriodosController < ApplicationController

  layout 'default'


 #def show
   
  #  @periodo = Periodo.find(params[:id])
   # respond_to do |format|

    #  format.html{render :layout => 'default'}
    #end
  #end


  def index
   
      @periodos = Periodo.paginate :page=> params[:page], :per_page=> 12, :order => 'mes DESC'

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
      
     format.html{redirect_to new_periodo_path}
   end

  end

end
