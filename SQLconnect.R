library(RMySQL)

# utf8
Sys.setlocale("LC_CTYPE", "UTF-8")
# options(encoding="UTF-8")


#------------ Connect database -------------------#

  con = dbConnect(MySQL(), user="team2", password="team2@tsp59",
                  dbname="tsp60_nu_oesdb",
                  host="10.80.39.17")
  
  dataFormDB <- dbGetQuery(con, "SELECT * FROM oes_result_exam")
  
  dbDisconnect(con)
  
#------------ Connect database -------------------#
  
  
# user: oesuser  
# pass: tsp60@oesuser
  
  con = dbConnect(MySQL(),
                  user="oesuser",
                  password="tsp60@oesuser",
                  dbname="tsp60_nu_srpdb",
                  host="10.80.39.17")
  
  dataFormDB <- dbGetQuery(con, "SELECT * FROM Amphur")
  
  dbDisconnect(con)
  
  con = dbConnect(MySQL(),
                  user="oesuser",
                  password="tsp60@oes",
                  dbname="tsp60_nu_srpdb",
                  host="10.80.39.17")
  
  dataFormDB <- dbGetQuery(con, "SELECT * FROM Amphur")
  
  dbDisconnect(con)
  
  
  
  