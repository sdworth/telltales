module ApplicationHelper

  def random_story
    start = Start.all.sample
    sample_text = start.story_text
    start.additions.each {|addition|
      sample_text = sample_text + ' ' + addition.addition_text
    }
    sample_text
  end
end
