/*Write uspGetEmployeeManagersPerDepartment stored procedure that returns 
direct managers of employees who work at specified department.*/


Create Procedure uspGetEmployeeManagersPerDepartment
	(@BusinessEntityID int)
AS
Begin

	Select  P.BusinessEntityID,P.FirstName,P.LastName,E.JobTitle,E.Gender,NewTable.Gender as ManagerGender,NewTable.FirstName as ManagerFirstName,NewTable.LastName as ManagerLastName,NewTable.JobTitle
	From HumanResources.EmployeeDepartmentHistory EDH 
		inner join HumanResources.Employee E on E.BusinessEntityID=EDH.BusinessEntityID
		inner join Person.Person P on P.BusinessEntityID=EDH.BusinessEntityID
		left join ( Select E.Gender,EDH.DepartmentID as  ManagerDepartmentID,P.FirstName,P.LastName,E.JobTitle
					From HumanResources.EmployeeDepartmentHistory EDH 
					inner join HumanResources.Employee E on E.BusinessEntityID=EDH.BusinessEntityID
					inner join Person.Person P on P.BusinessEntityID=EDH.BusinessEntityID 
					Where E.JobTitle Like('%Manager%'))
					 as NewTable on EDH.DepartmentID=NewTable.ManagerDepartmentID
	Where E.BusinessEntityID=@BusinessEntityID
End

Execute uspGetEmployeeManagersPerDepartment @BusinessEntityID=279;


Drop Procedure uspGetEmployeeManagersPerDepartment;
