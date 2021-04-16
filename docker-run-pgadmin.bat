@echo off

echo "Step 1- create a docker bridge network database-network "
docker network create psql-network 

echo "Step 2- create a docker conatiner: container-postgresdb "
docker run  --detach --network psql-network ^
  --name container-psql ^
  --publish 5432:5432 ^
  --env POSTGRES_USER=postgres ^
  --env POSTGRES_PASSWORD=****** ^
    postgres:latest   

 echo "Step 3- create a docker conatiner: container-pgadm "
 docker run --detach ^
   --network psql-network ^
   --name container-pgadm ^
   --publish 5050:80 ^
   --env PGADMIN_DEFAULT_EMAIL=sankarganesh.gandhi@gmail.com ^
   --env PGADMIN_DEFAULT_PASSWORD=******* ^
     dpage/pgadmin4

@echo on
