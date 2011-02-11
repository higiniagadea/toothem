class ProfesionalesController < ApplicationController

  before_filter :generar_submenus, :login_required
 

  # GET /profesionales
  # GET /profesionales.xml
  layout 'default'
  def index
    #@profesionales = Profesional.paginate :page=> params[:page], :conditions => ['consultorio_id in (?)', current_usuario.consultorios], :per_page=>15, :order=> 'nombre ASC'
    #@profesionales = Profesional.find(:all,:conditions => ['consultorio_id in (?)', current_usuario.consultorios])
   
    @profesionales = Profesional.paginate :page=> params[:page], :per_page => 10
   
    respond_to do |format|
      format.html {render :layout => 'default'}
      
    end
  end

  # GET /profesionales/1
  # GET /profesionales/1.xml
  def show   
    @profesional = Profesional.find(params[:id])   
    respond_to do |format|
    
      format.html { render :layout => 'default'}
    end
  end

  # GET /profesionales/new
  # GET /profesionales/new.xml
  def new
    
    @profesional = Profesional.new

    respond_to do |format|
      
      format.html  { render :layout => 'default' }
    end
  end

  # GET /profesionales/1/edit
  def edit
  
    @profesional = Profesional.find(params[:id])
    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end

  # POST /profesionales
  # POST /profesionales.xml
  def create
   
    params[:profesional][:consultorio_id]= current_usuario.consultorios
    @profesional = Profesional.new(params[:profesional])

    respond_to do |format|
      if @profesional.save
        flash[:notice] = 'Profesional creado.'
        format.html { redirect_to buscar_profesionales_path  }
       
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  # PUT /profesionales/1
  # PUT /profesionales/1.xml
  def update
  
    @profesional = Profesional.find(params[:id])

    respond_to do |format|
      if @profesional.update_attributes(params[:profesional])
        flash[:notice] = 'Profesional actualizado.'
        format.html { redirect_to buscar_profesionales_path  }
       
      else
        format.html { render :action => "edit" }
       
      end
    end
  end

  # DELETE /profesionales/1
  # DELETE /profesionales/1.xml
  def destroy
    @profesional = Profesional.find(params[:id])

    if @profesional.fichas.blank? 
      @profesional.destroy
      flash[:notice] = 'Profesional eliminado'
    else
      flash[:error] = "Imposible eliminar el profesional ya que posee registros asociados"
    end   

    respond_to do |format|
      format.html { redirect_to buscar_profesionales_path }
     
    end
  end


  def buscar
    respond_to do |format|
      format.html 

    end
  end

  def resultado
   respond_to do |format|         
       @profesionales = Profesional.basic_search(params).paginate(:page => params[:page], :per_page=> 1, :order => 'nombre ASC')
        format.html {render :partial => 'resultado', :layout => false}
      end

  end


  
end