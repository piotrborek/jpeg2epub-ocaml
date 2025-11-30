let zip_name = "zip"
let unzip_name = "unzip"
let convert_name = "convert"

let sys_path_list () =
    let path_opt = Sys.getenv_opt "PATH" in
    match path_opt with
    | Some path -> String.split_on_char ':' path
    | None -> []

let find_in_path prog_name (fs:_ Eio.Path.t) =
    let (/) = Eio.Path.(/) in
    let paths = sys_path_list () in
    let prog_paths = List.map (fun path -> path ^ "/" ^ prog_name) paths in
    let file_exists = fun prog_path ->
        Eio.Path.is_file @@ fs / prog_path
    in
    List.find_opt file_exists prog_paths

let find_zip_in_path (fs:_ Eio.Path.t) = find_in_path zip_name fs

let find_unzip_in_path (fs:_ Eio.Path.t) = find_in_path unzip_name fs

let find_convert_in_path (fs:_ Eio.Path.t) = find_in_path convert_name fs