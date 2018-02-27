module Ralyxa
  module ResponseEntities
    class DelegateDialog < Response
      def initialize
        super(nil, {}, false, nil, nil)
      end

      def to_h
        super.tap do |response|
          add_delegate(response)
        end
      end

      def self.as_hash(**options)
        new.to_h
      end

      private

      def add_delegate(response)
        response[:response] ||= {}
        response[:response][:directives] = [{ type: 'Dialog.Delegate' }]
      end
    end
  end
end
