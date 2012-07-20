class ContrariansController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :show, :index]

  def index
    @contrarians = Contrarian.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contrarians }
    end
  end

  # GET /contrarians/1
  # GET /contrarians/1.json
  def show
    @contrarian = Contrarian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contrarian }
    end
  end

  # GET /contrarians/new
  # GET /contrarians/new.json
  def new
    @contrarian = Contrarian.new

    respond_to do |format|
      format.html { flash[:notice] = 'All submissions will be reviewed by an administrator.' }
      format.json { render json: @contrarian }
    end
  end

  # GET /contrarians/1/edit
  def edit
    @contrarian = Contrarian.find(params[:id])
  end

  # POST /contrarians
  # POST /contrarians.json
  def create
    @contrarian = Contrarian.new(params[:contrarian])

    respond_to do |format|
      if params.has_key?(:cancel)
        format.html { redirect_to(contrarians_url) }
      elsif params.has_key?(:email)
        SubmissionNotifier.contrarian(@contrarian).deliver
        format.html { redirect_to contrarians_url, notice: 'Contrarian was successfully submitted.' }
      elsif session[:user_id] and @contrarian.save
        format.html { redirect_to @contrarian, notice: 'Contrarian was successfully created.' }
        format.json { render json: @contrarian, status: :created, location: @contrarian }
      else
        format.html { render action: "new" }
        format.json { render json: @contrarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contrarians/1
  # PUT /contrarians/1.json
  def update
    @contrarian = Contrarian.find(params[:id])

    respond_to do |format|
      if params.has_key?(:cancel)
        format.html { redirect_to(contrarian_url @contrarian) }
      elsif @contrarian.update_attributes(params[:contrarian])
        format.html { redirect_to @contrarian, notice: 'Contrarian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contrarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contrarians/1
  # DELETE /contrarians/1.json
  def destroy
    @contrarian = Contrarian.find(params[:id])
    @contrarian.destroy

    respond_to do |format|
      format.html { redirect_to contrarians_url }
      format.json { head :no_content }
    end
  end
end
