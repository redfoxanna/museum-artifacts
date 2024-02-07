--Query #1
select ARK_Room.RoomNameNumber as "Room"
, ARK_Location.LocationDescription "Location Description"
, AVG(ArtifactValue) as "Average Artifact Value"
from ((( ARK_Artifact
inner join ARK_Artifact_Location
on ARK_Artifact.ArtifactID =
    ARK_Artifact_Location.ArtifactID)
inner join ARK_Location
on ARK_Location.LocationID =
    ARK_Artifact_Location.LocationID)
inner join ARK_Room
on ARK_Room.RoomID = 
    ARK_Location.RoomID)
group by ARK_Room.RoomNameNumber, ARK_Location.LocationDescription
order by ARK_Room.RoomNameNumber, ARK_Location.LocationDescription;

--Query #2
select * from (select 
af.ArtifactDescription as "Description"
, al.dateplaced as "Date at Location"
, r.roomnamenumber as "Room"
, l.locationdescription as "Detailed Location"
from ark_artifact af
join ark_artifact_location al
on al.artifactid = af.artifactid
join ark_location l 
on l.locationid = al.locationid
join ark_room r
on l.roomid = r.roomid
union
select
ArtifactDescription as "Description"
, DateLost as "Date at Location"
, 'Lost' as "Room"
, 'Lost' as "Detailed Location"
from ark_artifact
where datelost is not null) m
order by "Description", "Date at Location"
;

--Query #3
select af.ArtifactDescription as "Artifact",
case
    when datelost is not null then (datelost - DatePlaced)
    else (current_date - al.DatePlaced) 
end as "Days on Display"
from ARK_Artifact_Location al
join ARK_Artifact af
on af.ArtifactID = al.ArtifactID
where al.DatePlaced = (
    select
        min(DatePlaced)
    from ARK_Artifact_Location
    where ArtifactID = al.ArtifactID
);

--Query #4
select af.ArtifactDescription as "Description"
, r.roomnamenumber as "Room"
, l.locationdescription as "Detailed Location"
, al.dateplaced as "Date at Location"
from ark_artifact af
join ark_artifact_location al
on al.artifactid = af.artifactid
join ark_location l 
on l.locationid = al.locationid
join ark_room r
on l.roomid = r.roomid
where af.datelost is null AND al.dateplaced =
    (select max(DatePlaced)
    from ARK_Artifact_Location
    where ArtifactID = al.ArtifactID)
order by "Description", "Room"
;
