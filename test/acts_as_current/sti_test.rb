#---------------------------------------------------------
# Requirements
#---------------------------------------------------------

# all generic stuff required by test helper
require "test/test_helper"



#---------------------------------------------------------
# Tests
#---------------------------------------------------------

class ActsAsCurrentStiTest < ActiveSupport::TestCase

  #---------------------------------------------
  # setup and teardown delegations
  #---------------------------------------------
  
  def setup
    setup_db
  end
  def teardown
    teardown_db
  end



  #---------------------------------------------
  # test composition
  #---------------------------------------------
  
  def test_composition_of_class
    assert BillingFrequency.respond_to?(:current)
    assert BillingFrequency.respond_to?(:current=)
    
    assert BillingFrequency.respond_to?(:acts_as_current_symbol,  true)
  end

  
  def test_composition_of_instance
    seed_billing_frequencies
    @one = BillingFrequency.first
    
    assert @one.respond_to?(:current?)
    assert @one.respond_to?(:current!)
  end
  
  
  
  #---------------------------------------------
  # test symbol method
  #---------------------------------------------
  
  def test_symbol_method
    assert_equal :billing_frequency, BillingFrequency.send(:acts_as_current_symbol)     # this notation bypasses privacy
  end
  
  
  
  #---------------------------------------------
  # test current methods
  #---------------------------------------------
  
  def test_current_methods
    seed_billing_frequencies
    @one = BillingFrequency.first
    @two = BillingFrequency.last
    
    # starts as nil
    assert BillingFrequency.current.nil?
    
    # set current to one explicitly (instances agree)
    BillingFrequency.current = @one
    assert_equal BillingFrequency.current, @one
    assert @one.current?
    assert !@two.current?
    
    # set current to two by conversion (instances agree)
    @two.current!
    assert_equal BillingFrequency.current, @two
    assert !@one.current?
    assert @two.current?
  end
  
end