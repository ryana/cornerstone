class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    if current_user.setup_subscription(params[:cc])
      flash[:notice] = 'Subscription created!'
      redirect_to root_path
    else
      flash[:alert] = 'Could not setup your subscription'
      logger.debug current_user.cc_subscription.errors.inspect
      render :action => :new
    end
  end
end
