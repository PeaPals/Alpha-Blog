## Postgres Commands

- To change psql port goto : `/etc/postgresql/<version>/main/` and change port in `postgresql.conf`.
  - edit `postgresql.conf` using `code` bt changing permissions of the file to read and write both.

- create new user using : `sudo -u postgres createuser <name>`

- To access postgres user terminal : `sudo -u <username> psql`
- To change postgres user password using terminal : `sudo -u postgres psql` and then `\password`
- To access start/stop/status psql server : `sudo service postgresql [start|stop|status]`


- `sudo lsof -i :5432`
- `sudo -e /etc/wsl.conf`
