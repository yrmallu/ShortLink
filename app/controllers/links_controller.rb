class LinksController < ApplicationController

  def new
    @link = Link.new
    current_user_links
  end

  def show
    link = Link.find_by(lookup_code: params[:lookup_code])

    if link
      link.update count: link.count + 1
      redirect_to link.original_url
    else
      flash[:alert] = 'Short link not found'
      redirect_to action: :new
    end

  end

  def create
    shortener = Shortener.new(link_params[:original_url], current_user)
    @link = shortener.generate_short_link

    if @link.persisted?
      current_user_links
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def current_user_links
    @user_links = current_user&.links
  end
end