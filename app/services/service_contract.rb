# Standardizes what a service method should always return
module ServiceContract
    # success case
    def self.success(payload)
        OpenStruct.new({ success?: true, payload: payload, errors: nil})
    end

    # error case
    def self.error(errors)
        OpenStruct.new({ success?: false, payload: nil, errors: errors})
    end
end