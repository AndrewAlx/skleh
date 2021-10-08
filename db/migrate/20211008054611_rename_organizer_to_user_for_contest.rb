class RenameOrganizerToUserForContest < ActiveRecord::Migration[6.1]
  def change
    rename_column :contests, :organizer_id, :user_id
  end
end
