#MYSQL with R
install.packages("RODBC")
library(RODBC)
sql_conn = odbcConnect("dsn1", uid="root", pwd = "root")
sqlTables(sql_conn)
# Query the database and put the results into the data frame "dataframe"
dataframe <- sqlQuery(sql_conn, "
                      SELECT *
                      FROM
                      T2")
View(dataframe)
#Selecting Few Column
df1 = sqlQuery(sql_conn,"
                select id
                from T1")
View(df1)
#Using Where Clause
df1 = sqlQuery(sql_conn,"
                select id
                from T1
               where name='A'")
View(df1)
