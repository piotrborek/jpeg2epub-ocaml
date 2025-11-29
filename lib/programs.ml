let zip_name = "zip"
let unzip_name = "unzip"
let convert_name = "convert"

let find_in_path _prog_name (_env:Eio.Fs.dir_ty Eio.Path.t) =
    (* let (/) = Eio.Path.(/) in *)
    let (let*) = Option.bind in
    let* path = Sys.getenv_opt "PATH" in
    let path_list = String.split_on_char ';' path in
    Some path_list