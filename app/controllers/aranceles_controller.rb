class ArancelesController < ApplicationController

  before_filter(:get_obra_social)
  before_filter :login_required
  layout 'default'

  def index
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 10, :order => 'prestacion_id  ASC'
    
    respond_to do |format|
      format.html {render :layout => 'default'}
    end
  end
  def new
    @arancel = @obra_social.aranceles.new
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 5   
    respond_to do |format|
      format.html {render :layout => false }
    end
  end

  def create
    @arancel = @obra_social.aranceles.new(params[:arancel])
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 15, :order => 'prestacion_id ASC'
   # @formulario = params[:arancel]
    respond_to do |format|
      if @arancel.save
        flash[:notice] = 'Arancel creado exitosamente.'
      
        format.html {redirect_to obra_social_aranceles_path}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def show
    @arancel = @obra_social.aranceles.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def destroy
    @arancel = @obra_social.aranceles.find(params[:id])

     @arancel.destroy
    respond_to do |format|        
      flash[:notice] = 'Arancel eliminado'
      format.html { redirect_to obras_sociales_path}      
    end
  end

  def edit    
    @arancel = @obra_social.aranceles.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def update
    @arancel = @obra_social.aranceles.find(params[:id])
    respond_to do |format|
      if @arancel.update_attributes(params[:arancel])
          flash[:notice] = 'Arancel actualizado'
          format.html{redirect_to obra_social_aranceles_path(@obra_social)}
#        format.html{
#          render :update do |page|
#            page["#{params[:arancel.id]}"].replace_html @arancel
#          end
#        }
#      else
#        format.html{
#          render :update do |page|
#            page["error_messages_for_#{params[:arancel.id]}"].replace_html nested_error_messages_for :obra_social
#          end
#        }
      end
    end
  end

  def busqueda
    respond_to do |format|
      format.html {render :layout => false}
  end
  end


  def resultados
    @aranceles = @obra_social.aranceles.find(:all, :conditions => {:prestacion_id => params[:arancel][:prestacion_id]})
   
     respond_to do |format|
        @aranceles = Arancel.basic_search
        format.html {render :partial => 'resultados', :layout => false}
      end
  end



  private  
  def get_obra_social
    @obra_social= ObraSocial.find(params[:obra_social_id])
  end
  

end
