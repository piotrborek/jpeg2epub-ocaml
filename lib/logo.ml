let logo_string = {raw|   _                          ____                           _
  (_)  _ __     ___    __ _  |___ \    ___   _ __    _   _  | |__
  | | | '_ \   / _ \  / _` |   __) |  / _ \ | '_ \  | | | | | '_ \
  | | | |_) | |  __/ | (_| |  / __/  |  __/ | |_) | | |_| | | |_) |
 _/ | | .__/   \___|  \__, | |_____|  \___| | .__/   \__,_| |_.__/
|__/  |_|             |___/                 |_|
|raw}

let print_logo ~stdout = 
    let open ANSITerminal in
    let text = sprintf [yellow] "%s" logo_string in
    Eio.Flow.copy_string text stdout