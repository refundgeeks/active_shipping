module ActiveShipping
  class ShipmentEvent
    attr_reader :name, :time, :location, :message, :type_code

    def initialize(name, time, location, message = nil, type_code = nil, exception_code = nil, exception_description = nil)
      @name, @time, @location, @message, @type_code, @exception_code, @exception_description = name, time, location, message, type_code, exception_code, exception_description
    end

    def delivered?
      status == :delivered
    end

    def status
      @status ||= name.downcase.gsub("\s", "_").to_sym
    end

    def ==(other)
      attributes = %i(name time location message type_code exception_code, exception_description)
      attributes.all? { |attr| self.public_send(attr) == other.public_send(attr) }
    end
  end
end
