def create_start(user, overrides = {})
  Start.create(
    {title: 'alpha dog', story_text: 'clap until you hands hurt', user_id: user.id}.merge(overrides)
  )
end

def create_other_start(user, overrides = {})
  Start.create(
    {title: 'time to dance', story_text: 'well shes not bleeding on the ballroom floor just for the attention', user_id: user.id}.merge(overrides)
  )
end

def create_addition(user, start, overrides = {})
  Addition.create(
    {start_id: start.id, user_id: user.id, addition_text: 'alpha dog and omegalomaniac. welcome to the new deja vu'}.merge(overrides)
  )
end