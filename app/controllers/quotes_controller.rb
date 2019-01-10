class QuotesController < ApplicationController
  before_action :set_quote, only: [:index, :new, :create]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end


  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @quotes = Quote.all

    respond_to do |format|
      if @quote.save
        format.html { redirect_to root_path, notice: 'Quote was successfully added.' }
        format.json { render :index, status: :created, location: @quotes }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quotes = Quote.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:quote, :author)
    end
end
