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
        let parse_area = function
            | s1::s2::s3::s4::[] ->
                begin
                    match int_of_string_opt s1, int_of_string_opt s2, int_of_string_opt s3, int_of_string_opt s4 with
                    | Some i1, Some i2, Some i3, Some i4 -> Some {x = i1; y = i2; width = i3; height = i4}
                    | _ -> None
                end
            | _ -> None
        in
        parse_area @@ String.split_on_char ' ' text
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