namespace "companies" do
  # TODO: REFACTOR
  # get overlapping entry pairs
  task generate_from_entries: :environment do
    vorkers_entries = VorkersEntry.where(company_id: nil)
    en_hyouban_entries = EnHyoubanEntry.where(company_id: nil)

    all_entries = vorkers_entries.to_a.concat(en_hyouban_entries.to_a)
    grouped_entries = all_entries.group_by { |el| el.name.tr("株式会社", "") }
      .select { |_k, v| v.length > 1 }

    grouped_entries.each do |shared_name, entry_arr|
      begin
        ActiveRecord::Base.transaction do
          company = Company.new(name: "UNSET (#{shared_name})")
          vorkers_entry, en_hyouban_entry = entry_arr
          vorkers_entry.company = company
          vorkers_entry.save!
          en_hyouban_entry.company = company
          en_hyouban_entry.save!
        end
      rescue => e
        puts "failed: #{e.message}"
        next
      end
    end
  end

  # update ratings for all companies
  task update_ratings: :environment do
    Company.all.each(&:update_rating)
  end

  task disable_unset: :environment do
    Company.where("name LIKE 'UNSET%'").each do |company|
      company.update(is_enabled: false)
    end
  end

  task enable_unset: :environment do
    Company.where("name LIKE 'UNSET%'").each do |company|
      company.update(is_enabled: true)
    end
  end
end
