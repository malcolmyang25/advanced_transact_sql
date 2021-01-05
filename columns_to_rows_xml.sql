SELECT B.[Tenant Code],
	stuff(
		(select ','+RTRIM(A.[Full Name]) 
		 FROM sdm_test A
          WHERE A.[Tenant Code]=B.[Tenant Code]
          FOR xml PATH('')), 1, 1, '') as name_merge
FROM sdm_test B
GROUP BY B.[Tenant Code];
