class EnHyoubanEntriesController < ApplicationController
  def show
    @entry = EnHyoubanEntry.find(params[:id])
  end
end
