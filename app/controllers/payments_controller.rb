class PaymentsController < ApplicationController


  def index
    @users = User.all
    @team = Team.find(params[:team_id])
  end

  # Show a user's profile page.
  # This is where you can spend money with the connected account.
  # app/views/users/show.html.haml
  def show
    @user = current_user
    @team = Team.find(params[:team_id])
    membership = Membership.find_by(player_id: current_user.id, team_id: @team.id)
    @amount_owed = membership.amount_owed
    @captain = @team.captain
    @plans = Stripe::Plan.all
    session[:saved_url] = request.original_url
    session[:amount_owed] = @amount_owed
  end

  # Make a one-off payment to the user.
  # See app/assets/javascripts/app/pay.coffee
  def pay
    # Find the user to pay.
    captain = User.find( params[:id] )

    # Charge amount owed over .971 to account for Stripe fee. This needs to be done here because the fee is being charged to the captain, so he needs to charge his players extra to account for the money being taken out of his take.
    amount = session[:amount_owed]/0.971
    # Calculate the fee amount that goes to the application.
    fee = (amount * Rails.application.secrets.fee_percentage).to_i

    begin
      charge_attrs = {
        amount: amount,
        currency: user.currency,
        source: params[:token],
        description: "Test Charge via Stripe Connect",
        application_fee: fee,
        destination: captain.stripe_user_id
      }

      # case params[:charge_on]
      # when 'connected'
      #   p charge_attrs
      #   # Use the user-to-be-paid's access token
      #   # to make the charge directly on their account
      #   charge = Stripe::Charge.create( charge_attrs, user.secret_key )
      # when 'platform'
      #   # Use the platform's access token, and specify the
      #   # connected account's user id as the destination so that
      #   # the charge is transferred to their account.
        # charge_attrs[:destination] = user.stripe_user_id
      charge = Stripe::Charge.create( charge_attrs )
      # end

      flash[:notice] = "Charged successfully! <a target='_blank' rel='#{params[:charge_on]}-account' href='https://dashboard.stripe.com/test/payments/#{charge.id}'>View in dashboard &raquo;</a>"

    rescue Stripe::CardError => e
      error = e.json_body[:error][:message]
      flash[:error] = "Charge failed! #{error}"
    end

    redirect_to session[:saved_url]
  end

  def update
    manager = current_user.manager
    manager.update_account! params: params
    redirect_to session[:saved_url]
  end

end
