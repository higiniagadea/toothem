class ArancelesController < ApplicationController

  before_filter(:get_obra_social)
  layout 'default'

  def index
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 4
    @pagetitle = "Aranceles"
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def new
    @arancel = @obra_social.aranceles.new
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 4
    @pagetitle = "Aranceles de "+ @obra_social.nombre
    @formulario = params[:arancel]
    respond_to do |format|
      format.html {render @formulario}
    end
  end

  def create
    @arancel = @obra_social.aranceles.new(params[:arancel])
    @aranceles = @obra_social.aranceles.paginate :page => params[:page], :per_page => 15
    @formulario = params[:arancel]
    respond_to do |format|
      if @arancel.save
        flash[:notice] = 'Arancel creado exitosamente.'
        format.html {redirect_to new_obra_social_arancel_path}
      else
        format.html { render :action => "new" }
      end
    end
  end
  def show
    @arancel = @obra_social.aranceles.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  def destroy
    @arancel = @obra_social.aranceles.find(params[:id])
    @arancel.destroy
    respond_to do |format|
      flash[:notice] = 'Arancel eliminado'
      format.html { redirect_to new_obra_social_arancel_path}
      
    end
  end

  def edit
    @pagetitle = "Editando arancel de " + @obra_social.nombre
    @arancel = @obra_social.aranceles.find(params[:id])
    
  end

  def update
    @arancel = @obra_social.aranceles.find(params[:id])
    respond_to do |format|
      if @arancel.update_attributes(params[:arancel])
          flash[:notice] = 'Arancel actualizado'
          format.html{redirect_to(new_obra_social_arancel_path(@obra_social))}
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

  

  private
  
  def get_obra_social
    @obra_social= ObraSocial.find(params[:obra_social_id])
  end


end
