class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :description
			t.string :user_id
			t.timestamps null: false
		end
	end
end
