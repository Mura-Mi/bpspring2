class InterestService

  SUPPORTED_TYPES = ['EventReport', 'EventPhoto', 'Event'];

  def initialize(user)
    @user = user
  end

  def register_interest(to_type, to_id, interest_type)
    if (!SUPPORTED_TYPES.include?(to_type))
      raise Exception.new("Unsupported Type: #{to_type}")
    elsif !Interest.interest_types.has_key?(interest_type)
      raise Exception.new("Unsupported Interest Type: #{interest_type}")
    end

    found = Interest.find_by from_id: @user.id, to_type: to_type, to_id: to_id, interest_type: Interest.interest_types[interest_type.to_sym]

    if (found == nil)
      i = Interest.new(from_id: @user.id, to_type: to_type, to_id: to_id, interest_type: Interest.interest_types[interest_type.to_sym])
      if (!i.save)
        i.errors
      else
        i
      end
    else
      found
    end

  end



end
