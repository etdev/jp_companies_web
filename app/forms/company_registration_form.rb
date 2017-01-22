class CompanyRegistrationForm
  include ActiveModel::Model

  attr_reader :attrs, :company, :vorkers_entry, :en_hyouban_entry

  def initialize(attrs)
    @attrs = attrs

    @company = Company.new(company_attrs)
    @vorkers_entry = VorkersEntry.find_or_initialize_by(vorkers_attrs)
    @en_hyouban_entry = EnHyoubanEntry.find_or_initialize_by(en_hyouban_attrs)
  end

  def valid?
    return false unless @name.present?

    !Company.exists?(name: @name)
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    ActiveRecord::Base.transaction do
      @company.save!

      @en_hyouban_entry.company = @company
      @en_hyouban_entry.save!

      @vorkers_entry.company = @company
      @vorkers_entry.save!
    end
  end

  def company_attrs
    attrs.fetch(:company)
  end

  def en_hyouban_attrs
    attrs.fetch(:en_hyouban_entry)
  end

  def vorkers_attrs
    attrs.fetch(:vorkers_entry)
  end
end
