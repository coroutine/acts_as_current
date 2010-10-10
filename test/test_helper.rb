#----------------------------------------------------------
# Requirements
#----------------------------------------------------------

# rails stuff
require "rubygems"
require "active_record"
require "active_support"
require "active_support/test_case"
require "test/unit"

# the plugin itself
require "#{File.dirname(__FILE__)}/../init"



#---------------------------------------------------------
# Database config
#---------------------------------------------------------

# establish db connection
begin
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
rescue ArgumentError
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
end


# define and seed tables
def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table :users do |t|
      t.string  :email,                       :limit => 255
      t.string  :crypted_password,            :limit => 255
      
      t.timestamps
    end
  end
  
  ActiveRecord::Schema.define(:version => 1) do
    create_table :labels do |t|
      t.string  :type,                        :limit => 255
      t.string  :system_label,                :limit => 255
      t.string  :label,                       :limit => 255
      
      t.timestamps
    end
  end
end


# seed users
def seed_users
  User.create!({ :email => "user_1@coroutine.com", :crypted_password => "not_crypted_but_does_not_matter_here" })
  User.create!({ :email => "user_2@coroutine.com", :crypted_password => "not_crypted_but_does_not_matter_here" })
end

# seed billing frequencies
def seed_billing_frequencies
  BillingFrequency.create!({ :system_label => "MONTHLY", :label => "Monthly" })
  BillingFrequency.create!({ :system_label => "YEARLY",  :label => "Yearly"  })
end


# drop all tables
def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end



#---------------------------------------------------------
# Model definitions
#---------------------------------------------------------

# users (simple case)
class User < ActiveRecord::Base
  acts_as_current
end


# labels (sti base)
class Label < ActiveRecord::Base
  acts_as_current
end


# billing frequencies (sti extension)
class BillingFrequency < Label
end



#----------------------------------------------------------
# Define global methods
#----------------------------------------------------------

class ActiveSupport::TestCase
  
  # This method allows us to use a convenient notation for testing
  # model validations.
  def assert_not_valid(object, msg="Object is valid when it should be invalid")
    assert(!object.valid?, msg)
  end
  alias :assert_invalid :assert_not_valid

end