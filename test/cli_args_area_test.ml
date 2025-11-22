open Jpeg2epub.Cli_args

let area = Alcotest.testable Area.pp Area.equal

let when_empty_string_should_return_none () =
    Alcotest.(check @@ option area) "returned none" (Area.create_from_string "") None

let suite =
    [ "when_empty_string_should_return_none", `Quick, when_empty_string_should_return_none
    ]

let () =
    Alcotest.run "cli_args_area_test" [ "cli_args.area", suite ]