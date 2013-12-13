class AccionesController < ApplicationController

  #layout 'default'
  before_filter  :generar_submenus


  def index

    @acciones = Accion.find(:all)

    respond_to do |format|
      format.html

    end
  end


  def show
    @accion = Accion.find(params[:id])

    respond_to do |format|

      format.html { render :layout => false }
    end
  end


  def new
    @accion = Accion.new

    respond_to do |format|

      format.html
    end
  end


  def edit
    @accion = Accion.find(params[:id])

    respond_to do |format|
      format.html {render :layout => false}
    end
  end


  def create

    @accion = Accion.new(params[:accion])

    respond_to do |format|
      if @accion.save
        flash[:notice] = 'Accion.'
        format.html { redirect_to(acciones_url) }

      else
        format.html { render :action => "new" }

      end
    end
  end



  
  def destroy
    @accion = Accion.find(params[:id])
    respond_to do |format|
      if @accion.destroy

        flash[:notice] = 'Accion eliminada.'


      end
      format.html { redirect_to(acciones_url) }

    end
  end

end