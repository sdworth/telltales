def create_user(overrides = {})
  User.create({
                 username: 'kaine',
                 password: 'nier',
                 email: 'gestalt@replicant.com'
               }.merge(overrides))
end

def create_other_user(overrides = {})
  User.create({
    username: 'erik',
    password: 'shaw',
    email: 'magneto@awesome.com'
              })
end

def full_name(person)
  [person.first_name, person.last_name].join(" ")
end