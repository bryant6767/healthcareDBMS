# healthcareDBMS
### Bryant Nguyen 
### March 12th, 2023 

## This DBMS is created in preparation for QA / Backend DB Engineer roles through a guided SQL course and uses healthcare pseudo-data.  

## INIT Instructions:  
  Initialize the DB and Tables by running the SQL file "CreateDBandTables.sql"  
  Since each table has a Primary Key, bridge communication between FactTable and dimension tables by running "CreateForeignKey.sql"  


Pseudo-data was referenced dataset pulls from King County public datasets.  

The Entity Relationship Diagram covers the high-level relationship between entities/dimensions:  
  FactTable  
  dimPatient  
  dimPhysician  
  dimDiagnosisCode  
  dimDate  
  dimLocation   
  dimTransaction  
  dimPayer  
  dimCptCode  
  
  
The Healthcare dataset issues the data used in the DBMS 
