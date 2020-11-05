class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist
    
    validates :name, :scientist_id, :planet_id, presence: true 
    validates :name, uniqueness: true 
end