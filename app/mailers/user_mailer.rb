class UserMailer < ApplicationMailer
    default from: 'listings@tcboard.net'
    def purchase_email
        @user = params[:user]
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Your listing has been sold!')
    end
end
