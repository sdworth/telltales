def create_start(overrides = {})
  Start.create(
    {title: 'alpha dog', story_text: 'clap until you hands hurt'}.merge(overrides)
  )
end

def create_addition(start, overrides = {})
  Addition.create(
    {start_id: start.id, addition_text: 'alpha dog and omegalomaniac. welcome to the new deja vu'}.merge(overrides)
  )
end