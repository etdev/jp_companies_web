class CompanySearcher
  def initialize(query)
    @query = query
  end

  def search
    Company.where("name LIKE ?", "%#{query}%")
  end

  private

  attr_reader :query
end
