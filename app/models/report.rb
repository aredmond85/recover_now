class Report < ApplicationRecord
   validates :subject, presence: true, length: { minimum: 6, maximum: 100 }
   validates :description, presence: true, length: { minimum: 10, maximum: 300 }

   belongs_to :user
   
   has_many :report_heros
   has_many :heros, through: :report_heros

   has_many :report_villains
   has_many :villains, through: :report_villains

    def self.search(search)
        if search
            hero = Hero.find_by(hero_name: search)
                if hero
                    self.where(hero_id: hero)
                else
                    Report.all
                end
        else
            Report.all
        end
    end
    
end
