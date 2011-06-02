module ActiveRecord
  module Associations
    module Builder
      class BelongsTo
        self.valid_options.push(:with_deleted)
      end
    end
    
    class BelongsToAssociation
      private
      
      def find_target
        if options[:with_deleted]
          scoped.unscoped
        else
          scoped
        end.first.tap { |record| set_inverse_instance(record) }
      end
    end
  end
end
