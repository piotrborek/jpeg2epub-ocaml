module Flags = struct
    type t = {
        input_from_file: bool;
        input_from_dir: bool;
        keep_temp: bool;
        overwrite: bool;
        trim: bool
    }
end

module Area = struct
    type t = {
        x: int;
        y: int;
        width: int;
        height: int;
    } [@@deriving show, eq]

    let create_from_string text =
        match text with
        | "" -> None
        | _  -> Some {x = 0; y = 0; width = 0; height = 0}
end

type t = {
    words: string list;
    output_image_quality: int;
    flags: Flags.t;
    cut_area: Area.t option;
}

let create ~words ~output_image_quality ~input_from_file ~input_from_dir ~keep_temp ~overwrite ~trim ~cut_area = {
    words;
    output_image_quality;
    flags = {
        input_from_file;
        input_from_dir;
        keep_temp;
        overwrite;
        trim;
    };
    cut_area;
}