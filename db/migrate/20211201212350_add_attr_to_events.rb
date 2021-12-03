class AddAttrToEvents < ActiveRecord::Migration[6.0]
  def change
    
    # create_table :events do |t|

    #   t.timestamps
    # end
    add_column :events, :title, :string
    add_column :events, :event_date, :date
    add_column :events, :event_time, :datetime
  end
end
