# list
# validates :name, presence: true, uniqueness: true
p 'Deleting database'
List.destroy_all
Bookmark.destroy_all

p 'Creating a list'

test_list = List.new(name: "test")
test_list.save

# bookmark
# validates :comment, presence: true, length: { minimum: 6 }
# validates :movie_id, uniqueness: { scope: :list_id, message: "Bookmark already exists for this movie in the list" }
p 'Creating a bookmark'
test_bookmark = Bookmark.new(comment: "test")
test_bookmark.save
