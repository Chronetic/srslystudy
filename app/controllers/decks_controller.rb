class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy, :study, :is_correct]
	require 'date'
  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all
  end

	def study
		@cardindex = params[:index]
		index = @cardindex.to_i
		if (index == 0)
			@cardindex = canBeUsed(@deck, index)
		end
		#puts @deck.cards[index].srslevel
		#puts @deck.cards[index].created_at
		@currday = Date.today

		#@date = Date.today
		#@date2 = Date.today + 60
		#puts (@date2 - @date).to_i
		#puts "index: " + @cardindex
	end

	def is_correct
		index = params[:value_index].to_i
		#puts "pIndex"
		#puts params[:value_index].to_i
		#puts "size " + @deck.cards.size.to_s
		#@date = Date.today + 10
		#puts (@deck.cards[index].created_at).to_date
		#puts (@date - (@deck.cards[index].created_at).to_date).to_i

		if index < @deck.cards.size
			#canBeUsed(@deck, index)
			@deck.cards[index].answer = params[:value].to_s
			#puts params[:value]
			#puts "hello"
			#puts @deck.cards[index].answer
			#puts index
			#puts @deck.cards[index].meaning.to_s

			respond_to do |format|
	      if @deck.cards[index].answer.to_s == @deck.cards[index].meaning.to_s
					@deck.cards[index].srslevel += 1
					@deck.cards[index].cardtype = Date.today
					puts "hello"
					puts @deck.cards[index].srslevel
					@deck.save
					puts @deck.cards[index].srslevel
					puts "goodbye"
					new_index = canBeUsed(@deck, index+1)
	        format.html { redirect_to study_decks_path(@deck, :index => new_index), notice: 'Correct!' }
	      else
					puts index
					new_index = canBeUsed(@deck, index+1)
					if (@deck.cards[index].srslevel > 1)
						@deck.cards[index].srslevel = @deck.cards[index].srslevel - 1
					end
					puts @deck.cards[index].srslevel
					puts new_index
					@deck.cards[index].cardtype = Date.today
					@deck.save
	        format.html { redirect_to study_decks_path(@deck, :index => new_index), notice: 'Incorrect :(' }
	      end
	    end
		end
	end

	def srs

	end

	def canBeUsed(deck, index)
		@currday = Date.today
		#puts @deck.cards[0].cardtype
		if index >= @deck.cards.size
			return -1
		end

		dif = (@currday - Date.parse(@deck.cards[index].cardtype)).to_i
		#puts dif

		if @deck.cards[index].srslevel.to_i == 1
			return index
		elseif dif == 0 && @deck.cards[index].srslevel.to_i != 1
			for ind in (index.to_i...@deck.cards.length)
				if @deck.cards[ind].srslevel.to_i == 1
#					puts "why"
					return ind
				else
					return -1
				end
			end
		end

		if dif != 0 && dif.even? && @deck.cards[index].srslevel.to_i == 2
			#puts "pls"
			return index
		elseif dif != 0 && dif.even? && @deck.cards[index].srslevel.to_i != 2
			for ind in (index.to_i...@deck.cards.length)
				if @deck.cards[ind].srslevel.to_i == 2
#					puts "does"
					return ind
				else
					return -1
				end
			end
		end
#		puts "dd"

		if dif != 0 && (dif % 4 == 0) && @deck.cards[index].srslevel.to_i == 3
			return index
		elseif dif != 0 && (dif % 4 == 0) && @deck.cards[index].srslevel.to_i != 3
			for ind in (index.to_i...@deck.cards.length)
				if @deck.cards[ind].srslevel.to_i == 3
#						puts "this"
					return ind
				else
					return -1
				end
			end
		end

		if dif != 0 && (dif % 9 == 0) && @deck.cards[index].srslevel.to_i == 4
			return index
		elseif dif != 0 && (dif % 9 == 0) && @deck.cards[index].srslevel.to_i != 4
			for ind in (index.to_i...@deck.cards.length)
				if @deck.cards[ind].srslevel.to_i == 4
#						puts "happen"
					return ind
				else
					return -1
				end
			end
		end

		if @deck.cards[index].srslevel.to_i == 5
			return -1
		end

		canBeUsed(deck, index+1)
	end

  # GET /decks/1
  # GET /decks/1.json
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = Deck.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:title, :category, :user_id, :cardcount)
    end
end
