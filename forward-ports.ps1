start-process -FilePath "vagrant" -ArgumentList ("ssh", "--",  "-L", "5432:localhost:5432") # PostgreSQL
start-process -FilePath "vagrant" -ArgumentList ("ssh", "--",  "-L", "9443:localhost:9443") # Portainer
start-process -FilePath "vagrant" -ArgumentList ("ssh", "--",  "-L", "3000:localhost:3000") # Grafana
