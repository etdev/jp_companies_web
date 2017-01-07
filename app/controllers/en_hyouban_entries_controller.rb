class EnHyoubanEntriesController < ApplicationController
  def show
    @entry = EnHyoubanEntry.find(params[:id])
  end

  def index
    @entries = EnHyoubanEntry.all
  end
end
