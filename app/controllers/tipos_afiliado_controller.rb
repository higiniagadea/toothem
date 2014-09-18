class TiposAfiliadoController < ApplicationController
  # GET /tipos_documentos
  # GET /tipos_documentos.xml
  layout 'default'
  def index
    @tipos_afiliado = TipoAfiliado.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_afiliado }
    end
  end

  # GET /tipos_documentos/1
  # GET /tipos_documentos/1.xml
  def show
    @tipo_afiliado = TipoAfiliado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_afiliado }
    end
  end

  # GET /tipos_documentos/new
  # GET /tipos_documentos/new.xml
  def new
    @tipo_afiliado = TipoAfiliado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_afiliado }
    end
  end

  # GET /tipos_documentos/1/edit
  def edit
    @tipo_afiliado = TipoAfiliado.find(params[:id])
  end

  # POST /tipos_documentos
  # POST /tipos_documentos.xml
  def create
    @tipo_afiliado = TipoAfiliado.new(params[:tipo_afiliado])

    respond_to do |format|
      if @tipo_afiliado.save
        flash[:notice] = 'Tipo tipo_afiliado creado.'
        format.html { redirect_to(@tipo_afiliado) }
        format.xml  { render :xml => @tipo_afiliado, :status => :created, :location => @tipo_afiliado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_afiliado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_documentos/1
  # PUT /tipos_documentos/1.xml
  def update
    @tipo_afiliado = TipoAfiliado.find(params[:id])

    respond_to do |format|
      if @tipo_afiliado.update_attributes(params[:tipo_afiliado])
        flash[:notice] = 'Tipo TipoAfiliado actualizado.'
        format.html { redirect_to(@tipo_afiliado) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_afiliado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_documentos/1
  # DELETE /tipos_documentos/1.xml
  def destroy
    @tipo_afiliado = TipoAfiliado.find(params[:id])
    @tipo_afiliado.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_afiliado_url) }
      format.xml  { head :ok }
    end
  end
end
