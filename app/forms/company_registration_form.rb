class CompanyRegistrationForm
  include ActiveModel::Model

  attr_reader :attrs, :company, :vorkers_entry, :en_hyouban_entry

  def initialize(attrs)
    @attrs = attrs

    @company = Company.new(company_attrs)
    @vorkers_entry = VorkersEntry.find_by(vorkers_attrs)
    @en_hyouban_entry = EnHyoubanEntry.find_by(en_hyouban_attrs)
  end

  def valid?
    return false unless @company.present?
    !Company.exists?(name: @company.name)
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

      if @en_hyouban_entry.present?
        @en_hyouban_entry.company = @company
        @en_hyouban_entry.save!
      end

      if @vorkers_entry.present?
        @vorkers_entry.company = @company
        @vorkers_entry.save!
      end
    end
  end

  def company_attrs
    attrs.slice(:name, :name_jp, :name_kana, :employees_count)
  end

  def en_hyouban_attrs
    attrs.slice(:en_hyouban_id)
  end

  def vorkers_attrs
    attrs.slice(:vorkers_id)
  end
end
