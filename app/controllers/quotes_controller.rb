class QuotesController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :show, :index]

  def index
    @quotes = Quote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote = Quote.new
    @contrarians = Contrarian.all

    respond_to do |format|
      format.html { flash[:notice] = 'All submissions will be reviewed by an administrator.' }
      format.json { render json: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
    @contrarians = Contrarian.all
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(params[:quote])

    @quote.entered = Date.today

    respond_to do |format|
      if params.has_key?(:cancel)
        format.html { redirect_to(quotes_url) }
      elsif params.has_key?(:email)
        SubmissionNotifier.quote(@quote).deliver
        format.html { redirect_to quotes_url, notice: 'Quote was successfully submitted.' }
      elsif session[:user_id] and @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render json: @quote, status: :created, location: @quote }
      else
        format.html { render action: "new" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if params.has_key?(:cancel)
        format.html { redirect_to(quote_url @quote) }
      elsif @quote.update_attributes(params[:quote])
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end
end
