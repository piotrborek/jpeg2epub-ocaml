open Climate

let program_name = Program_name.Literal "jpeg2epub"
let program_version = "1.0.0"

let cli_parser =
    let open Arg_parser in
    let+ output_image_quality = named_with_default ["quality"] int ~default:90 ~doc:"Output jpeg image quality. Default: 90"
    and+ input_from_file = flag ["i"] ~doc:"Get input images from a file"
    and+ input_from_dir = flag ["I"] ~doc:"Get input images from a directory"
    and+ keep_temp = flag ["keep-temp"] ~doc:"Don't delete temp directory"
    and+ overwrite = flag ["w"] ~doc:"Overwrite output file if exists"
    and+ trim = flag ["C"] ~doc:"Removes edges from input images"
    and+ _cut_area = named_with_default ["cut"] string ~default:"" ~doc:"Cut area from images. Format: \"x y width height\""
    and+ words = pos_all string ~doc:"File name or diretory name" in
    Cli_args.create ~words ~output_image_quality ~input_from_file ~input_from_dir ~keep_temp ~overwrite ~trim ~cut_area:None

let cli_run () =
    Command.run_singleton ~program_name ~version:program_version cli_parser