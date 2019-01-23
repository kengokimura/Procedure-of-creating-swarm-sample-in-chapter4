#!/bin/sh

system=${1:-todo_mysql_master}
echo "$system"


echo "## docker container exec -it manager docker service ps $system --no-trunc --filter \"desired-state=running\" --format \"docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash\""
docker container exec -it manager docker service ps $system --no-trunc --filter "desired-state=running" --format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash"

echo "-- You should execute 'init-data.sh' in the above container to initialize database."
echo "-- Then execute 'mysql -p' (password:gihyo. please see \"./stack/todo-mysql.yml\" for more details) "
echo "-- If you want to add data record, execute the following cmd for example after logging in to mysql with above password..."
echo "## 'insert into todo(\`title\`, \`content\`, \`status\`, \`created\`, \`updated\`) VALUES('hoge','hoge','DONE',NOW(),NOW());'"
