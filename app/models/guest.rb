class Guest
  include Authority::UserAbilities

  def guest?
    true
  end

  def admin?
    false
  end

end