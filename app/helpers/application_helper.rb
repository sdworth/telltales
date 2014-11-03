module ApplicationHelper

  def random_story
    start = Start.all.sample
    if start
      sample_text = start.story_text
      start.additions.each { |addition|
        sample_text = sample_text + ' ' + addition.addition_text
      }
      sample_text
    else
      sample_text = 'i found the cure to growing older'
    end
  end
end
