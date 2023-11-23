#!/bin/bash

docker exec -it magellanic-metadata psql -U magellanic -c "INSERT INTO dashboard_user(username, password, name, is_email_confirmed, chargebee_customer_id) VALUES ('admin@magellanic.ai', '\$2a\$12\$vyCLswzwcuX4J389MOqoOurAcYfouGHKmKtn37GqukM7NA4Qf8lu2', 'Admin MGL', 't', '')"