require_relative '../test_helper'

class IntersectionTest < Test::Unit::TestCase

  def setup
    @codes = AnalyzeCodes.load_found_codes('./test/fixtures/codes_found.json')
    @value_sets = AnalyzeCodes.load_value_sets('./test/fixtures')
  end
  
  def test_intersection
    result = AnalyzeCodes.analyze_value_sets(@value_sets, @codes)
    result.length.must_equal @value_sets.length
    result['1.2.3.4.5.6.7.8.9.0'][:totalCodes].must_equal 1
    result['1.2.3.4.5.6.7.8.9.0'][:codesFound].must_equal 1
    result['1.2.3.4.5.6.7.8.9.0'][:percentFound].must_equal 100.0
    result['2.4.6.8.10'][:totalCodes].must_equal 1
    result['2.4.6.8.10'][:codesFound].must_equal 0
    result['2.4.6.8.10'][:percentFound].must_equal 0.0
  end
end
