class MealDbResponseJob
  include Sidekiq::Job

  def perform(search_term)
    Redis.new.set("found_search", search_term)
  end
end
