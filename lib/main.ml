let main () =
    let _cli_args = Cli.cli_run () in
    Eio_main.run @@ fun env ->
        Logo.print_logo env#stdout;
        let _zip_path = Programs.find_zip_in_path env#fs in
        let _unzip_path = Programs.find_unzip_in_path env#fs in
        let _convert_path = Programs.find_convert_in_path env#fs in
        ()