User.delete_all
Artwork.delete_all
ArtworkShare.delete_all
Comment.delete_all

u1 = User.create!(username: "Alice")
u2 = User.create!(username: "Kevin")
u3 = User.create!(username: "Kevin99")
u4 = User.create!(username: "99Kevin")
u5 = User.create!(username: "Alice Kevin! ")

a1 = Artwork.create!(title: "Starry Nights", image_url: "http://starrynights.com", artist_id: u1.id)
a2 = Artwork.create!(title: "Mona Lisa", image_url: "http://monalisa.com", artist_id: u2.id)
a3 = Artwork.create!(title: "Sunflowers", image_url: "http://sunflowers.com", artist_id: u1.id)
a4 = Artwork.create!(title: "Scream", image_url: "http://scream.com", artist_id: u2.id)

aws1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
aws2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)
aws3 = ArtworkShare.create!(artwork_id: a4.id, viewer_id: u1.id)
aws4 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u2.id)
aws5 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u1.id)

c1 = Comment.create!(user_id: u1.id, artwork_id: a1.id, body: "Very pretty")
c2 = Comment.create!(user_id: u2.id, artwork_id: a2.id, body: "Super pretty")
c3 = Comment.create!(user_id: u1.id, artwork_id: a4.id, body: "Very disturbing")
