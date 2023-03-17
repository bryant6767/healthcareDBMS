USE Healthcare_DB

--Basic Patient (Anna) Search by PatientNumber
SELECT
	FirstName
	,LastName
	,City
	,State
FROM dimPatient
WHERE dimPatient.PatientNumber = '21383737'


--Query for Patient (Anna) hospital visit to Fairview General Hospital
--Only way for dimPatient to communicate with dimLocation is through FactTable, requires INNER JOIN
--Added DISTINCT to only return unique values
--with where AND locationname = 'Fairview...'
SELECT DISTINCT
	FirstName
	,LastName
	,City
	,State
	,LocationName
	,dimDateServicePK
FROM FactTable
	INNER JOIN dimPatient
		on dimPatient.dimPatientPK = FactTable.dimPatientPK
	INNER JOIN dimLocation
		on dimLocation.dimLocationPK = FactTable.dimLocationPK
WHERE dimPatient.PatientNumber = '21383737'
	and LocationName = 'Fairview General Hospital'
	
	
--Find Physicians that took care of Patient (Anna) 
--includes sum of charges issued from each physician/provider
SELECT DISTINCT
	dimpatient.FirstName
	,dimpatient.LastName
	,dimpatient.City
	,dimpatient.State
	,dimlocation.LocationName
	,dimDateServicePK
	,dimPhysician.ProviderName
	,Sum(FactTable.GrossCharge) as Charges
FROM FactTable
	INNER JOIN dimPatient
		on dimPatient.dimPatientPK = FactTable.dimPatientPK
	INNER JOIN dimLocation
		on dimLocation.dimLocationPK = FactTable.dimLocationPK
	INNER JOIN dimPhysician
		on dimPhysician.dimPhysicianPK = FactTable.dimPhysicianPK
WHERE dimPatient.PatientNumber = '21383737'
	and LocationName = 'Fairview General Hospital'
Group by 
	dimpatient.FirstName
	,dimpatient.LastName
	,dimpatient.City
	,dimpatient.State
	,dimlocation.LocationName
	,dimDateServicePK
	,dimPhysician.ProviderName
	

--Primary Diagnosis Code for Specific Patient (Anna) at Fairview
SELECT DISTINCT
	dimPhysician.ProviderName
	,dimDiagnosisCode.DiagnosisCode
	,dimDiagnosisCode.DiagnosisCodeDescription
	,Sum(FactTable.GrossCharge) as Charges
FROM FactTable
	INNER JOIN dimPatient
		on dimPatient.dimPatientPK = FactTable.dimPatientPK
	INNER JOIN dimLocation
		on dimLocation.dimLocationPK = FactTable.dimLocationPK
	INNER JOIN dimPhysician
		on dimPhysician.dimPhysicianPK = FactTable.dimPhysicianPK
	INNER JOIN dimDiagnosisCode
		on dimDiagnosisCode.dimDiagnosisCodePK = FactTable.dimDiagnosisCodePK
WHERE dimPatient.PatientNumber = '21383737'
	and LocationName = 'Fairview General Hospital'
Group by 
	dimPhysician.ProviderName
	,dimDiagnosisCode.DiagnosisCode
	,dimDiagnosisCode.DiagnosisCodeDescription