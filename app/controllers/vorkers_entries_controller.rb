class VorkersEntriesController < ApplicationController
  def show
    @vorkers_entry = VorkersEntry.find(params[:id])
  end

  def index
    @vorkers_entries = VorkersEntry.all
      .page(params[:page])
  end
end
