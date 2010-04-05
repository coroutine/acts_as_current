#---------------------------------------------------------
# Requirements
#---------------------------------------------------------

# all generic stuff required by test helper
require "test/test_helper"



#---------------------------------------------------------
# Tests
#---------------------------------------------------------

class ActsAsCurrentBaseTest < ActiveSupport::TestCase

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
    assert_respond_to ::ActiveRecord::Base, :acts_as_current
  end

end