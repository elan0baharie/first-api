class Seed
  @@quote_ids = []

  def self.begin
    seed = Seed.new
    seed.generate_quotes
    seed.generate_comments
  end

  def generate_quotes
    20.times do |i|
      quote = Quote.create!(
        author: Faker::Book.author,
        content: Faker::ChuckNorris.fact
      )
      @@quote_ids.push(quote.id)
      puts "Quote #{i}: Author is #{quote.author} and quotation is '#{quote.content}'."
    end
  end

  def generate_comments
    40.times do |i|
      comment = Comment.create!(
        commenter: Faker::Name.name,
        body: Faker::Simpsons.quote,
        quote_id: Faker::Number.between(@@quote_ids[0], @@quote_ids[19])
      )
    end
    puts '40 comments generated'
  end



end

Seed.begin
