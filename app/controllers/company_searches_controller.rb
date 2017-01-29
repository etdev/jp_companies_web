class CompanySearchesController < ApplicationController
  def index
    @query = query

    @companies = CompanySearcher.new(@query)
      .search
      .page(params[:page])
  end

  private

  def query
    params[:search][:query]
  end
end
