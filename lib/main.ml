let main () =
    let _cli_args = Cli.cli_run () in
    let area1 = {
        Cli_args.Area.x = 1;
        y = 2;
        width = 3;
        height = 4;
    } in
    let area2 = {
        Cli_args.Area.x = 1;
        y = 2;
        width = 3;
        height = 4;
    } in
    let _cmp = (area1 == area2) in
    let _xx = (Format.printf "test: %a@\n" Cli_args.Area.pp) in
    Format.printf "test: %a@\n" Cli_args.Area.pp area1;
    Eio_main.run @@ fun env ->
        Logo.print_logo ~stdout:env#stdout
