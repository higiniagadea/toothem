class OdontogramasController < ApplicationController  

  layout 'default'
  before_filter  :generar_submenus
  before_filter :login_required

   def index

    respond_to do |format|
     format.html{ render :layout => 'default'}
    end
  end

  def show
    #@odontograma = Odontograma.find(params[:id])

    respond_to do |format|

      format.html{ render :layout => 'default'}
    end
  end

  
  def new
 
    @odontograma = Odontograma.new

    respond_to do |format|

      format.html{ render :layout=> 'default' }
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

    respond_to do |format|
      if @odontograma.save
        flash[:notice] = 'Odontograma creada.'
        format.html { redirect_to(odontogramas_url) }

      else
        format.html { render :action => "new" }

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

  end

