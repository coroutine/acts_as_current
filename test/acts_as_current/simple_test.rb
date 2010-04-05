#---------------------------------------------------------
# Requirements
#---------------------------------------------------------

# all generic stuff required by test helper
require "test/test_helper"



#---------------------------------------------------------
# Tests
#---------------------------------------------------------

class ActsAsCurrentSimpleTest < ActiveSupport::TestCase

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
    assert User.respond_to?(:current)
    assert User.respond_to?(:current=)
    
    assert User.respond_to?(:acts_as_current_symbol,  true)
  end

  
  def test_composition_of_instance
    seed_users
    @one = User.first
    
    assert @one.respond_to?(:current?)
    assert @one.respond_to?(:current!)
  end
  
  
  
  #---------------------------------------------
  # test symbol method
  #---------------------------------------------
  
  def test_symbol_method
    assert_equal :user, User.send(:acts_as_current_symbol)              # this notation bypasses privacy
  end
  
  
  
  #---------------------------------------------
  # test current methods
  #---------------------------------------------
  
  def test_current_methods
    seed_users
    @one = User.first
    @two = User.last
    
    # starts as nil
    assert User.current.nil?
    
    # set current to one explicitly (instances agree)
    User.current = @one
    assert_equal User.current, @one
    assert @one.current?
    assert !@two.current?
    
    # set current to two by conversion (instances agree)
    @two.current!
    assert_equal User.current, @two
    assert !@one.current?
    assert @two.current?
  end
  
end