select 
    artist.Name as "Artist Name",
    count(track.TrackId) as "Number of Tracks",
    sum(track.UnitPrice) as "Total cost"
from 
	musicsales.track
inner join
	musicsales.album
on
	track.AlbumID = album.AlbumID
inner join
	musicsales.artist
on
	album.ArtistId = artist.ArtistId
group by
	artist.ArtistId
order by
	sum(track.UnitPrice) desc;