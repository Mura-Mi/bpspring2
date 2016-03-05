module InterestSubject
  extend ActiveSupport::Concern

  def interested_people
    map = Hash.new
    Interest.where(
      to_id: id,
      to_type: self.class.name.split('::').last
    ).each { |interest|
      # FIXME isn't it N+1 ??
      ar = map[interest.interest_type]
      if ar == nil
        map[interest.interest_type] = [ interest.user.name ]
      else
        map[interest.interest_type].push( interest.user.name )
      end
    }
    map
  end

# @param [User] user to inspect
# @param [String or Symbol] interest_type to inspect
# @return [bool] true if user is interested in this object for given type
  def interested?(user, type)
    if self.interested_people[type.to_s] && self.interested_people[type.to_s].include?(user.name)
      true
    else
      false
    end
  end

end
