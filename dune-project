(lang dune 3.8)

(name db_up)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)
(map_workspace_root false)
(package
 (name db_up)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune ez_file ppx_blob)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
