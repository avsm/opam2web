open O2wTypes
open OpamTypes
open Printf

exception Unknown_repository of string

type options = {
  mutable href_prefix: string;
}

let user_options = {
  href_prefix = "";
}

let make_webpage repo_info = 
  let page_html = O2wMinihome.to_html "" repo_info in
  print_endline  (Cow.Html.to_string page_html)

let () =
  let dirname = OpamFilename.Dir.of_string "." in
  printf "=== Repository: %s ===\n%!" (OpamFilename.Dir.to_string dirname);
  let repo_info = O2wRepository.of_path dirname in
  make_webpage repo_info
