module ProfilesHelper
  def last_login(user)
    time_ago_in_words(user.last_sign_in_at) + " ago"
  end

  def display_slug(profile)
    "http://kolosek.com/author/" + profile.slug
  end

  def logged?(id)
    id == current_user.profile.id
  end
end
