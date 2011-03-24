class TitularesController < ApplicationController
  
  layout 'default'
   before_filter :login_required
  def index
    @titulares = Titular.all
    @pagetitle = "Titulares"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titulares }
    end
  end

 
  def show
  @titular = Titular.find(params[:id])

    respond_to do |format|
     format.html # show.html.erb
     format.xml  { render :xml => @titular }
    end
  end

  def new
    @titular = Titular.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titular }
    end
  end

  
  def edit
    @titular = Titular.find(params[:id])
  
  end

 
  def create
    @titular = Titular.new(params[:titular])
 
    respond_to do |format|
      if @titular.save
        flash[:notice] = 'Titular creado.'
        
        
        format.html { redirect_to(@titular) }
        format.xml  { render :xml => @titular, :status => :created, :location => @titular }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titular.errors, :status => :unprocessable_entity }
      end
    end
  end
  

 
  def update
    @titular = Titular.find(params[:id])

    respond_to do |format|
      if @titular.update_attributes(params[:titular])
        flash[:notice] = 'Titular actualizado'
        format.html { redirect_to(@titular) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titular.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @titular = Titular.find(params[:id])

    @titular.destroy

    respond_to do |format|

      flash[:notice] = 'Titular eliminado'
      
      format.html { redirect_to titulares_path }
      format.xml  { head :ok }
    end
  end
  def buscar
    @pagetitle = "Buscar titular"
    respond_to do |format|
      format.html # buscar.html.erb

    end
  end
  def resultado
    @titulares = Titular.basic_search(params)
    respond_to do |format|
      format.html {render :layout => false}
    end
  end
def verificar_matricula
   
    @titular = Titular.find(:first, :conditions => {:matricula => params[:titular][:matricula]})
    respond_to do |format|
    format.json { render :json => !@titular}
    end
  end

def verificar_nroafiliado
  @titular = Titular.find(:first, :conditions => {:nro_afiliado => params[:titular][:nro_afiliado]})
    respond_to do |format|
    format.json { render :json => !@titular}
    end
  end
end
