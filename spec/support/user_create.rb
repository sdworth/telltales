def create_user(overrides = {})
  User.create!({
                 username: 'kaine',
                 password: 'nier',
                 email: 'gestalt@replicant.com'
               }.merge(overrides))
end

def full_name(person)
  [person.first_name, person.last_name].join(" ")
end