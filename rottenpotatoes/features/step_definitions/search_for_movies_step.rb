Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie, director|
  Movie.find_by_title(movie).director == director
end 

Then /I should see "(.*)" before "(.*)"/ do |movie1, movie2|
  expect(page.body.index(movie1) < page.body.index(movie2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end