module Coroutine
  module ActsAsCurrent
    
    # This module defines methods that will be mixed into the class definition when acts_as_current
    # is invoked.
    #
    # The notation used below assumes the module will be invoked using the :extend method, ensuring
    # the wrapping scope is the class object.
    #
    module ClassMethods      
    
      # This method returns the reference to the instance defined as current.
      #
      def current
        Thread.current[acts_as_current_symbol]
      end
      
      # This method sets the reference to the instance defined as current.
      #
      def current=(instance)
        unless (instance.is_a?(self) || instance.nil?)
          raise(ArgumentError, "The method expected an instance of class '#{name}', but instead was given #{instance.inspect}") 
        end
        Thread.current[acts_as_current_symbol] = instance
      end
      
      
      private 
      
      # This method returns the singularized, underscored symbol for the class.
      #
      def acts_as_current_symbol
        name.underscore.to_sym
      end
      
    end
  
  end
end