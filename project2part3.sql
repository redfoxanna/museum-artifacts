-- Anna Kessler
-- SQL Online Fall 2022
--Project 2, Part 3


--Report #1
select sum(ArtifactValue)
from ARK_Artifact
where DateLost is not null;

--Report #2
select ARK_Artifact.ArtifactDescription as "Artifact"
    , ARK_Artifact.ArtifactValue as "Artifact Value"
    , ARK_Employee_Appraisals.AppraisalDate as "Appraisal Date"
    , (ARK_Employee.EmployeeFirstName ||' '|| ARK_Employee.EmployeeLastName) as "Employee Name"
from ((ARK_Artifact
inner join ARK_Employee_Appraisals
on ARK_Artifact.ArtifactID = 
    ARK_Employee_Appraisals.ArtifactID)
inner join ARK_Employee
on ARK_Employee.EmployeeID =
    ARK_Employee_Appraisals.EmployeeID);

--Report #3
select ARK_Artifact.ArtifactDescription as "Artifact"
    , ARK_Room.RoomNameNumber as "Room"
    , ARK_Location.LocationDescription as "Location"
    , ARK_Artifact.ArtifactValue as "Value"
    , ARK_Artifact.ArtifactDateAquired as "Date Acquired"
    , ARK_Artifact_Location.DatePlaced as "Date At Location"
    , ARK_Artifact.DateLost as "Date Lost"
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
inner join ARK_Location_Type
on ARK_Location_Type.LocationTypeID = 
    ARK_Location.LocationTypeID
where ARK_Location_Type.LocationTypeName = 'Display';