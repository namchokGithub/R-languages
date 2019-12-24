library(RMySQL)

#------------ Connect database -------------------#

  con = dbConnect(MySQL(),
                  user="team2",
                  password="team2@tsp59",
                  dbname="r_database",
                  host="10.80.39.191")
  
  dataFormDB <- dbGetQuery(con, "SELECT * FROM music_record")
  dbDisconnect(con)
  
#------------ Connect database -------------------#
  