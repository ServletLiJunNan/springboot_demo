rem
rem  requirement:
rem    1: download flyway(command-line version) at https://flywaydb.org/
rem    2: make $PATH point to flyway.cmd
rem

flyway.cmd -configFile=./flyway.conf -schemas=lijunnan migrate
