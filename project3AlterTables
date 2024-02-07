-- Anna Kessler
-- Project #3

--add DateDamaged to ark_artifact
alter table ARK_Artifact
add DateDamaged date null
default null;

--update ark_artifact
update ARK_Artifact
set ArtifactDateAquired = '2018-12-18'
, ArtifactValue = 12700.00
, DateLost = NULL
where artifactid = 6;

update ARK_Artifact
set ArtifactDateAquired = '1995-12-08'
, ArtifactValue = 25000.00
, DateLost = NULL
where artifactid = 7;

update ARK_Artifact
set ArtifactDateAquired = '1991-12-12'
, ArtifactValue = 2500.00 
, DateLost = NULL
where artifactid = 8;

update ARK_Artifact
set ArtifactDateAquired = '2002-06-07'
, ArtifactValue = 150.00
, DateLost = NULL
where artifactid = 9;

--create new room row for A14
insert into ARK_Room values (
    default 
    , 'A14'
);

--create new LocationDesciption rows
insert into ARK_Location values (
    default--6
    , 5
    , 'right wall, plexi-case 14'
    , 1
);

insert into ARK_Location values (
    default--7
    , 5
    , 'dislay stand 8'
    , 1
);

insert into ARK_Location values (
    default--8
    , 5
    , 'display stand 11'
    , 1
);

insert into ARK_Location values (
    default--9
    , 3
    , 'shelves along the right wall'
    , 1
);

--insert new location data for each artifact:
insert into ARK_Artifact_Location values (
    '2018-12-19'
    , 6--artifactid
    , 6--locationid
);

insert into ARK_Artifact_Location values (
    '1996-01-05'
    , 7
    , 7
);

insert into ARK_Artifact_Location values (
    '1999-06-11'
    , 7--artifactid
    , 8--locationid
);

insert into ARK_Artifact_Location values (
    '2007-09-09'
    , 7--artifactid
    , 9--locationid
);

insert into ARK_Artifact_Location values (
    '1999-06-11'
    , 8--artifactid
    , 7--locationid
);

insert into ARK_Artifact_Location values (
    '2007-09-09'
    , 9--artifactid
    , 8--locationid
);










