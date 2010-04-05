module Coroutine
  module ActsAsCurrent
    
    # This module defines methods that will be mixed into the instance when acts_as_current is invoked.
    #
    # The notation used below assumes the module will be invoked using the :include method, ensuring
    # the wrapping scope is the instance object.
    #
    module InstanceMethods      
    
      # This method returns a boolean indicating whether or not the instance is defined
      # as the current instance of the class.
      #
      def current?
        !self.class.current.nil? && self.id == self.class.current.id
      end
      
      # This method forces the instance to become the defined current instance of the 
      # class.
      #
      def current!
        self.class.current = self
      end
    
    end
  
  end
end