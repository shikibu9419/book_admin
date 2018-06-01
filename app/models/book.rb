class Book < ApplicationRecord
  # Define enum "status" (resevation: 0, now_on_sale: 1, end_of_print: 2)
  enum status: %w(resevation now_on_sale end_of_print)

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ? ", "%#{theme}%") }

  def high_price?
    price >= 5000
  end

  # Define publisher (in Publisher)
  belongs_to :publisher

  # Define book_authors (in Book_author)
  has_many :book_authors
  has_many :authors, through: :book_authors

  # Validations
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  validates :price, numericality: {
    greater_than_or_equal_to: 0 }

  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end

  # Callbacks
  # Cat -> lovely Cat
  before_validation do |book|
    book.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  # Write log destroyed_data
  after_destroy :if => :high_price? do |book|
    Rails.logger.warn "Book with high price is deleted: #{book.attributes.inspect}"
    Rails.logger.warn "Please check!!"
  end

end
