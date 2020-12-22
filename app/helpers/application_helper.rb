module ApplicationHelper
  def profile_photo(user)
    return user.profile_photo unless user.profile_photo.nil?

    user.profile_photo = '/assets/default_icon.jpeg'
  end
end
