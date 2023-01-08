seet -e
bin/rails db:migrate
#bin/rails db:seed
rm -f rmp/pids/server.pid && bin/rails s