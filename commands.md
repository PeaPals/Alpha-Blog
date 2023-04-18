## Postgres Commands

- To change psql port goto : `/etc/postgresql/<version>/main/` and change port in `postgresql.conf`.
  - edit `postgresql.conf` using `code` bt changing permissions of the file to read and write both.

- create new user using : `sudo -u postgres createuser <name>`

- To access postgres user terminal : `sudo -u <username> psql`
- To change postgres user password using terminal : `sudo -u postgres psql` and then `\password`
- To access start/stop/status psql server : `sudo service postgresql [start|stop|status]`
- To access running pids/server using port on linux use `sudo lsof -i :<port>`


## To migrate sqlite data to postgresql

- install pgloader using `apt-get install pgloader`
- use pgloader to load sqlite data using `pgloader ./db/<db_name>.sqlite3 pgsql://<user>:<password>@<host-ip>:<host-port>/<db_name>`
