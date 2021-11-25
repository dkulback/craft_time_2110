require './lib/craft'

RSpec.describe Craft do
  let(:craft) { Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 }) }
  it 'exists' do
    actual = craft
    expected = Craft

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = craft.name
      expected = 'knitting'

      expect(actual).to eq(expected)
    end
    it 'has supplies required' do
      actual = craft.supplies_required
      expected = { yarn: 20, scissors: 1, knitting_needles: 2 }

      expect(actual).to eq(expected)
    end
  end
end
