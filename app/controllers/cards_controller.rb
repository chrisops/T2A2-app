class CardsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :delete, :edit, :update, :checkout]
    before_action :get_logged_in_user, only: [:new, :index, :show, :create, :edit, :update, :checkout]
    before_action :get_card_from_params, only: [:show, :destroy, :edit, :update, :checkout]
    
    @@card_condition = {
        "NM" => "Near Mint",
        "LP" => "Lightly Played",
        "MP" => "Moderately Played",
        "HP" => "Heavily Played/Damaged"
    }

    def new
        @card = Card.new
    end

    def checkout
        
        if user_signed_in?
            Stripe.api_key = ENV['STRIPE_SECRET']
            session = Stripe::Checkout::Session.create({
                payment_method_types: ['card'],
                customer_email: @user[:email],
                line_items: [{
                    price_data: {
                        currency: 'aud',
                        product_data: {
                            name: @card.name
                        },
                        unit_amount: (@card.price * 100).to_i
                    },
                    quantity: @card.qty
                }],
                mode: 'payment',
                success_url: "#{root_url}payments/success?cardId=#{@card.id}",
                cancel_url: "#{root_url}cards"
            })

            render json: session
            # @session_id = session.id
        end
    end

    def show
        @condition = @@card_condition[@card.condition]
    end

    def index
        @cards = Card.search(params[:search]).page(params[:page])
        @search_path = cards_path
    end

    def edit
        if @card.user != @user
            flash.now[:errors] = "You can't edit another user's listing"
            render action: 'show'
        end
    end

    def update
        if @card.user != @user
            flash.now[:errors] = "You can't edit another user's listing"
            show
            render action: 'show'
        else
            if @card.update(card_params)
                flash.now[:errors] = "Updated successfully"
                show
                render action: 'show'
            else
                flash.now[:errors] = @card.errors.full_messages
                show
                render action: 'show'
            end
        end
    end

    def destroy
        if @card.user == current_user
            @card.destroy
            redirect_to cards_path
        else
            flash.now[:errors] = "You can't delete a card you don't own"
            index
            render action: 'index'
        end
    end

    def create
        @card = Card.new(card_params)
        if @card.save
            redirect_to @card
        else
            flash.now[:errors] = @card.errors.full_messages
            new
            render action: 'new'
        end
    end

    private

    def card_params
        fields = params.require(:card).permit(:name, :price, :condition, :user_id, :qty, :card_image, :search)
        fields[:user] = current_user
        return fields
    end

    def get_card_from_params
        @card = Card.find(params[:id])
    end

end
