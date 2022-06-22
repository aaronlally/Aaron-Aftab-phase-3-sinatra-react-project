class Book < ActiveRecord::Base
    belongs_to :author

    def self.alphabetical_order
        self.order(:title)
    end
    def self.order_by_rating
        self.order(:rating)
    end
    def self.order_by_release_date
        self.order(:release_date)
    end
    def self.highest_rating
        self.order(:rating).last
    end
    def self.lowest_rating
        self.order(:rating).first
    end
    def self.popular_books
        self.where("rating > ?", 5)
    end
    def self.unpopular_books
        self.where("rating < ?", 5)
    end
end