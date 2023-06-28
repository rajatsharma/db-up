open Ez_file

let () =
  let project_name = FileString.getcwd () |> FileString.basename in
  let docker_compose =
    Printf.sprintf [%blob "docker-compose.yaml"] project_name
  in
  let file_path =
    "docker-compose.yaml" |> FileAbstract.add_path (FileAbstract.getcwd ())
  in
  docker_compose |> FileAbstract.write_file file_path
