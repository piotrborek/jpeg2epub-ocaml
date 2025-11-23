open Jpeg2epub.Cli_args

let area = Alcotest.testable Area.pp Area.equal

let test_create_from_string ~text ~expected () =
    Alcotest.(check @@ option area) "" expected (Area.create_from_string text)

let suite =
    [ "when_empty_string_should_return_none", `Quick, test_create_from_string ~text:"" ~expected:None
    ; "when_wrong_string_1_should_return_none", `Quick, test_create_from_string ~text:"a" ~expected:None
    ; "when_wrong_string_2_should_return_none", `Quick, test_create_from_string ~text:"a b" ~expected:None
    ; "when_wrong_string_3_should_return_none", `Quick, test_create_from_string ~text:"a b c" ~expected:None
    ; "when_wrong_string_4_should_return_none", `Quick, test_create_from_string ~text:"a b c d" ~expected:None
    ; "when_wrong_string_5_should_return_none", `Quick, test_create_from_string ~text:"a b c d e" ~expected:None
    ; "when_wrong_string_6_should_return_none", `Quick, test_create_from_string ~text:"1" ~expected:None
    ; "when_wrong_string_7_should_return_none", `Quick, test_create_from_string ~text:"1 2" ~expected:None
    ; "when_wrong_string_8_should_return_none", `Quick, test_create_from_string ~text:"1 2 3" ~expected:None
    ; "when_wrong_string_9_should_return_none", `Quick, test_create_from_string ~text:"1 2 3 4 5" ~expected:None
    ; "when_string_should_return_area", `Quick, test_create_from_string ~text:"1 2 3 4" ~expected:(Some {Area.x = 1; y = 2; width = 3; height = 4})
    ]

let () =
    Alcotest.run "cli_args_area_test" [ "cli_args.area", suite ]