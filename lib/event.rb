class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendees.map(&:name)
  end

  def craft_with_most_supplies
    crafts.max_by{|craft| craft.supplies_required.length}.name
  end

  def supply_list
    crafts.flat_map(&:supplies_required).flat_map(&:keys).map(&:to_s).uniq
  end
  def attendees_by_craft_interest
    crafts.map(&:name).each_with_object({}) do |name, result|
      result[name] = attendees.find_all do |attendee|
        attendee.interests.include?(name)
      end
    end
  end
  def crafts_that_use(supply)
    crafts.find_all{|craft| craft.supplies_required.include?(supply.to_sym)}
  end
end
