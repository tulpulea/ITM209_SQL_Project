select 
    artist.Name as "Artist Name",
    album.Title as "Album Title",
    track.Name as "Track Name",    
    sum(invoiceline.Quantity) as "Number of Tracks"
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
left join
	musicsales.invoiceline
on
	track.TrackId = invoiceline.TrackId
group by
	track.TrackId
having 
	sum(invoiceline.Quantity) is null;