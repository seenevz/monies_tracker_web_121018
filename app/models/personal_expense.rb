class PersonalExpense < ApplicationRecord
    belongs_to :user
    has_one :shared_wallet
    belongs_to :category
    accepts_nested_attributes_for :category

    # validates :name, :amount, presence: true

    def category_attribures=(category_attribute)
        
          category = Category.find_or_create_by(category_attribute)
          byebug
          self.categories << category
        
    end

    def category_name
        self.category.name
    end

    def user_id
        self.user.id
    end
end
