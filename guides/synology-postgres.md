### Postgres setup on Synology

This is a guide on how to setup `postgresql` and `pgAdmin` on a Synology NAS using `docker` containers.

### Step 1 - Install container manager on the Synology NAS

### Step 2 - Create a project in container manager

First, create the following directories as host for the containers:
- `/volume1/docker/postgresql` as root for `PostgreSQL`
- `/volume1/docker/postgresadmin` as root for `pgAdmin`

You can change the directory structure as you prefer, as long as you change the 
paths in the YAML configuration file below:

```yaml
version: '3.9'
services:  
  db:
    container_name: PostgreSQL
    image: postgres
    mem_limit: 256m
    cpu_shares: 768
    healthcheck:
      test: ["CMD", "pg_isready", "-q", "-d", "marius_DB", "-U", "root"]
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: mariushostingroot
      POSTGRES_DB: marius_DB
    volumes:
      - /volume1/docker/postgresql:/var/lib/postgresql/data:rw
    ports:
      - 2665:5432
    restart: on-failure:5
  
  pgadmin:
    container_name: pgAdmin
    image: dpage/pgadmin4:latest
    mem_limit: 256m
    cpu_shares: 768
    healthcheck:
      test: wget --no-verbose --tries=1 --spider http://localhost:5050
    environment:
      PGADMIN_DEFAULT_EMAIL: Your-own-email@-address
      PGADMIN_DEFAULT_PASSWORD: mariushosting
      PGADMIN_LISTEN_PORT: 5050
    ports:
      - 2660:5050
    volumes:
      - /volume1/docker/postgresadmin:/var/lib/pgadmin:rw
    restart: on-failure:5
```

### References
- [https://mariushosting.com/how-to-install-postgresql-on-your-synology-nas/](https://mariushosting.com/how-to-install-postgresql-on-your-synology-nas/)
- [https://www.reddit.com/r/synology/comments/1cdkknb/create_a_project_on_container_manager_using/](https://www.reddit.com/r/synology/comments/1cdkknb/create_a_project_on_container_manager_using/)
- [https://medium.com/biomknx/deploy-your-postgresql-database-in-a-docker-container-on-a-nas-synology-9f24c18e47c8](https://medium.com/biomknx/deploy-your-postgresql-database-in-a-docker-container-on-a-nas-synology-9f24c18e47c8)
