class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
		t.string :comment_detail
		t.string :user_id
		t.string :property_id
		t.timestamps null: false
		end
	end
end
