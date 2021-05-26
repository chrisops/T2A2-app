class MainController < ApplicationController

    before_action :get_cards, only: [:index]

    def index
    end

    def account
        get_logged_in_user
        @user_viewed = User.find(params[:id])
        if params[:search]
            @cards = Card.search(params[:search],@user_viewed.id).page(params[:page])
        else
            @cards = @user_viewed.cards.page(params[:page])
        end
        @search_path = user_account_path(@user_viewed)
    end

    private

    def get_cards
        @cards = Card.order('id DESC')
    end

end
