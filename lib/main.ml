let main () =
    let cli_args = Cli.cli_run () in
    begin
        match cli_args.cut_area with
        |   None -> Format.printf "None"
        |   Some x -> Format.printf "%a@\n" Cli_args.Area.pp x
    end;
    Eio_main.run @@ fun env ->
        let _x = env#fs in
        Logo.print_logo ~stdout:env#stdout
