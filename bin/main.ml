open Ez_file

let () =
  let contents project =
    Printf.sprintf
      "# A Docker Compose must always start with the version tag.\n\
       # We use '3' because it's the last version.\n\
       version: '3'\n\n\
       # You should know that Docker Compose works with services.\n\
       # 1 service = 1 container.\n\
       # For example, a service, a server, a client, a database...\n\
       # We use the keyword 'services' to start to create services.\n\
       services:\n\
      \  # The name of our service is `database`\n\
      \  # but you can use the name of your choice.\n\
      \  # Note: This may change the commands you are going to use a little bit.\n\
      \  database:\n\
      \    # Official Postgres image from DockerHub (we use the last version)\n\
      \    image: 'postgres:latest'\n\n\
      \    # By default, a Postgres database is running on the 5432 port.\n\
      \    # If we want to access the database from our computer (outside the \
       container),\n\
      \    # we must share the port with our computer's port.\n\
      \    # The syntax is [port we want on our machine]:[port we want to \
       retrieve in the container]\n\
      \    # Note: You are free to change your computer's port,\n\
      \    # but take into consideration that it will change the way\n\
      \    # you are connecting to your database.\n\
      \    ports:\n\
      \      - 5432:5432\n\n\
      \    environment:\n\
      \      POSTGRES_USER: postgres # The PostgreSQL user (useful to connect \
       to the database)\n\
      \      POSTGRES_PASSWORD: postgres # The PostgreSQL password (useful to \
       connect to the database)\n\
      \      POSTGRES_DB: %s_dev # The PostgreSQL default database \
       (automatically created at first launch)\n\n\
      \ " project
  in
  let file_path =
    FileAbstract.add_path (FileAbstract.getcwd ()) "docker-compose.yaml"
  in
  FileString.getcwd () |> FileString.basename |> contents
  |> FileAbstract.write_file file_path
