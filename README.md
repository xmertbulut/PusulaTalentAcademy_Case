# PusulaTalentAcademy_Case
Question 1: Performance & Scalability Analysis in Hospital Data
1.1 What could be the reasons for the performance degradation?
The performance degradation might be due to the lack of indexes on columns such as HastaId and IslemTarihi. Additionally, the presence of large data fields like Aciklama (nvarchar(500)) could be occupying excessive space in the table. It’s also possible that old records have not been archived.

1.2 What improvements would you suggest for better sustainability?
It appears that columns like HastaId and IslemTarihi are the most frequently used, so I would add indexes to these. For Aciklama column, a separate table could be created to optimize storage and performance.

1.3 Do you think using the table in this way for 5 years was the correct approach? Why or why not?
With 25,000 records being inserted daily, it was foreseeable that the table would grow significantly over the years, leading to performance issues. A different design could have been considered. For instance, creating separate tables for each year (e.g., HastaIslemLog2025) might have been a better approach.

QUESTİON 2:Index Strategy & Query Optimization Thinking
I’m not sure why LOWER(AdSoyad) is used, but since the query will convert all names to lowercase first, it will negatively impact performance. If an index has been added to the AdSoyad column, the LOWER(AdSoyad) function will prevent that index from being utilized. The same applies to YEAR(KayitTarihi). If these are intended to be used this way, special indexes should be created for them. Additionally, since a person’s name is likely to start directly with their name in the records (e.g., not something like "123ahmet"), using LIKE 'ahmet%' would be more logical. Finally, the SELECT * usage will retrieve all columns, so it would be better to query only the specific columns we need.

Thank you..
