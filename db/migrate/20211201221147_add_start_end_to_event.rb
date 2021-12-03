class AddStartEndToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_start, :datetime
    add_column :events, :event_end, :datetime
    remove_column :events, :event_time
  end
end
