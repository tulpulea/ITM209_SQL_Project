select 
    artist.Name as "Artist Name",
	sum(invoiceline.Quantity) as "Total tracks sold"
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
inner join
	musicsales.invoiceline
on
	track.TrackId = invoiceline.TrackId
group by
	artist.ArtistId
having 
	sum(invoiceline.Quantity) >= 20
order by
	sum(invoiceline.Quantity) desc;
