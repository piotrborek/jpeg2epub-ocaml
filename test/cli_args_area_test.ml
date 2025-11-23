open Jpeg2epub.Cli_args

let area = Alcotest.testable Area.pp Area.equal

let when_empty_string_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "")

let when_wrong_string_1_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "test")

let when_wrong_string_2_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "a b c d")

let when_wrong_string_3_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "a b c")

let when_wrong_string_4_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "1")

let when_wrong_string_5_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "1 2")

let when_wrong_string_6_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "1 2 3")

let when_wrong_string_7_should_return_none () =
    Alcotest.(check @@ option area) "returned none" None (Area.create_from_string "1 2 3 4 5")

let when_string_should_return_area () =
    let expected = Some {Area.x = 1; y = 2; width = 3; height = 4} in
    Alcotest.(check @@ option area) "returned none" expected (Area.create_from_string "1 2 3 4")

let suite =
    [ "when_empty_string_should_return_none", `Quick, when_empty_string_should_return_none
    ; "when_wring_string_1_should_return_none", `Quick, when_wrong_string_1_should_return_none
    ; "when_wring_string_2_should_return_none", `Quick, when_wrong_string_2_should_return_none
    ; "when_wring_string_3_should_return_none", `Quick, when_wrong_string_3_should_return_none
    ; "when_wring_string_4_should_return_none", `Quick, when_wrong_string_4_should_return_none
    ; "when_wring_string_5_should_return_none", `Quick, when_wrong_string_5_should_return_none
    ; "when_wring_string_6_should_return_none", `Quick, when_wrong_string_6_should_return_none
    ; "when_wring_string_7_should_return_none", `Quick, when_wrong_string_7_should_return_none
    ; "when_string_should_return_area", `Quick, when_string_should_return_area
    ]

let () =
    Alcotest.run "cli_args_area_test" [ "cli_args.area", suite ]