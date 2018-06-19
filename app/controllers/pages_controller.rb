class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :become_host]
  def home
  end
  def become_host

  end
end
