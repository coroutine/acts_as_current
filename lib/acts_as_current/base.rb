module Coroutine
  
  # This module is an acts_as extension that teaches an ActiveRecord model how to provide a reference
  # to the instance owned by the current thread through a class method.
  #
  # The module includes class methods and instance methods that simplify the process of storing the 
  # current reference in a thread safe manner.
  #
  # Because acts_as_current relies on the Thread.current hash, it should probably be used sparingly.
  # 
  module ActsAsCurrent
    
    # This module provides the base functionality for the acts_as_current extension.  It declares the
    # class method acts_as_current and handles including all necessary sub modules when the class
    # method is invoked.
    # 
    module Base
      
      def self.included(klass)        #:nodoc:
        klass.class_eval do
          
          # This class method extends an ActiveRecord class with behavior appropriate for providing a
          # current instance to the request.
          #
          # Including this method in a model definition adds two public class methods and two public 
          # instance methods to the model. See modules below for method defintions.  Here's a simple
          # skeleton that demonstrates the resulting interface.
          #
          #
          # class MyClass < ActiveRecord::Base
          #
          #   def self.current
          #   end
          #
          #   def self.current=(instance)
          #   end
          #
          #   def current?
          #   end
          #
          #   def current!
          #   end
          #
          # end
          #
          def self.acts_as_current

            # mixin methods
            extend  Coroutine::ActsAsCurrent::ClassMethods
            include Coroutine::ActsAsCurrent::InstanceMethods

          end
          
        end
      end      
      
    end    
  end
end