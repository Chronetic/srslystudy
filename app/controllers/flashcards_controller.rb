class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:show, :edit, :update, :destroy]

	def study
		@@incrementer = 0
		@flashcards = Flashcard.all
		@currcard = @flashcards[@@incrementer]

	end

	def is_correct
		@flashcards = Flashcard.all

	end

	def fetch
		@flashcards = Flashcard.all
		@@incrementer+=1
		@newcard = @flashcards[@@incrementer]
		puts @@incrementer
		respond_to do |format|
			format.js
		end
		puts @newcard.meaning
	end

  # GET /flashcards
  # GET /flashcards.json
  def index
    @flashcards = Flashcard.all
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
  end

  # GET /flashcards/new
  def new
    @flashcard = Flashcard.new
  end

  # GET /flashcards/1/edit
  def edit
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    @flashcard = Flashcard.new(flashcard_params)

    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to @flashcard, notice: 'Flashcard was successfully created.' }
        format.json { render :show, status: :created, location: @flashcard }
      else
        format.html { render :new }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flas:cardtype:cardtypehcards/1
  # PATCH/PUT /flashcards/1.json
  def update
    respond_to do |format|
      if @flashcard.update(flashcard_params)
        format.html { redirect_to @flashcard, notice: 'Flashcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @flashcard }
      else
        format.html { render :edit }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
    @flashcard.destroy
    respond_to do |format|
      format.html { redirect_to flashcards_url, notice: 'Flashcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @flashcard = Flashcard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flashcard_params
      params.require(:flashcard).permit(:data, :meaning, :reading, :kunreading, :onreading, :syn, :tos, :meaningmem, :readingmem, :srslevel, :cardtype, :card_id, :user_id)
    end
end
