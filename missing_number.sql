#Assumption
#num_table --> 1,2,4,5
#missing number --> 3

WITH recursive  Missing As
(
 SELECT 1 AS missnum, select max(id) as maxid from num_table 
 UNION ALL
 SELECT missnum + 1, maxid FROM Missing
 WHERE missnum < maxid
)
SELECT missnum
FROM Missing
LEFT OUTER JOIN num_table tt on tt.id = Missing.missnum
WHERE tt.id is NULL
