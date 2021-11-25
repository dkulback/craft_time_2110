require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  let(:craft) { Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 }) }
  let(:person) { Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] }) }
  let(:event) { Event.new("Carla's Craft Connection", [craft], [person]) }
  it 'exists' do
    actual = event
    expected = Event

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = event.name
      expected = "Carla's Craft Connection"

      expect(actual).to eq(expected)
    end
    it 'has a crafts' do
      actual = event.crafts
      expected = [craft]

      expect(actual).to eq(expected)
    end
    it 'has a attendees' do
      actual = event.attendees
      expected = [person]

      expect(actual).to eq(expected)
    end
  end
  describe '#attendee_names' do
    it 'lists attendee names in array' do
      toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.attendee_names
      expected = %w[Hector Toni]

      expect(actual).to eq(expected)
    end
  end
  describe '#craft_with_most_supplies' do
    it 'lists the craft with the most supplies' do
      toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.craft_with_most_supplies
      expected = 'sewing'

      expect(actual).to eq(expected)
    end
  end
  describe '#supply_list' do
    it 'lists the craft supply list' do
      toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.supply_list
      expected = %w[fabric scissors thread sewing_needles yarn knitting_needles]

      expect(actual).to eq(expected)
    end
  end
  describe '#attendees_by_craft_interest' do
    it 'lists the craft the attendee is interested in' do
      tony = Person.new({ name: 'Tony', interests: %w[drawing knitting] })
      toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      painting = Craft.new('painting', { canvas: 1, paint_brush: 2, paints: 5 })
      knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
      actual = event.attendees_by_craft_interest
      expected =
        {
          'knitting' => [toni, tony],
          'painting' => [],
          'sewing' => [hector, toni]
        }

      expect(actual).to eq(expected)
    end
  end
  describe '#crafts_that_use' do
    it 'lists the craft that use supply' do
      tony = Person.new({ name: 'Tony', interests: %w[drawing knitting] })
      toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      painting = Craft.new('painting', { canvas: 1, paint_brush: 2, paints: 5 })
      knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
      actual = event.crafts_that_use('scissors')
      expected = [knitting, sewing]

      expect(actual).to eq(expected)
    end
  end
end
