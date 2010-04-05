# external gems
require "active_record"


# acts_as_current extension
require File.dirname(__FILE__) + "/acts_as_current/base"
require File.dirname(__FILE__) + "/acts_as_current/class_methods"
require File.dirname(__FILE__) + "/acts_as_current/instance_methods"


# add extensions to active record
::ActiveRecord::Base.send(:include, Coroutine::ActsAsCurrent::Base)