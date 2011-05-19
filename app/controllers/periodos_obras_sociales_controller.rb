class PeriodosObrasSocialesController < ApplicationController
  layout 'default'

  def index
     @periodos_obras_sociales = PeriodoObraSocial.paginate(:page=> params[:page], :per_page=> 12, :order => 'mes DESC', :conditions => ['fue_liquidado = ?', false])
   respond_to do |format|
     format.html

    end
  end
  
  
  def new
      @periodo_obra_social = PeriodoObraSocial.new

     respond_to do |format|
      format.html{render :partial => 'new', :layout => 'default'}
     end
  end

  def show
  end

  

  def edit
  end

  def create
     @periodo_obra_social = PeriodoObraSocial.new(params[:periodo_obra_social])

    respond_to do |format|

       if @periodo_obra_social.save
        flash[:notice] = 'Per&iacute;odo Guardado'
        format.html { redirect_to buscar_periodos_obras_sociales_path}
       else
          format.html { render :partial => 'new', :layout => 'default' }
      end
    end
  end


  def edit
    @periodo_obra_social = PeriodoObraSocial.find(params[:id])

    respond_to do |format|
      format.html {render :layout => false}
    end
  end


  def update
     @periodo_obra_social = PeriodoObraSocial.find(params[:id])

    respond_to do |format|
      if @periodo_obra_social.update_attributes(params[:periodo_obra_social])
        flash[:notice] = 'Per&iacute;odo actualizado'
        format.html { redirect_to buscar_periodos_obras_sociales_path }

      else
        format.html { render :action => "edit" }

      end
    end
  end

  def destroy
    @periodo_obra_social = PeriodoObraSocial.find_by_id(params[:id])

    if @periodo_obra_social.fue_liquidado == true
      flash[:notice] = 'El per&iacute;odo no puede ser borrado ya que no fue liquidado'
    else
      @periodo_obra_social.destroy
      flash[:notice] = 'Per&iacute;odo eliminado'
    end
   respond_to do |format|

     format.html{redirect_to buscar_periodos_obras_sociales_path}
   end

  end


   def buscar
    respond_to do |format|
      format.html
    end
  end

   
  def resultado
    respond_to do |format|
    params[:mes] = params[:periodo]['mes(1i)'.to_sym]

        @periodos_obras_sociales = PeriodoObraSocial.buscar(params[:mes]).paginate :page=> params[:page], :per_page=> 12 , :order => 'mes DESC'
        format.html {render :partial => 'resultado'}

  end
  end
end
