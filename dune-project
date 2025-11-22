(lang dune 3.20)

(name jpeg2epub)

(generate_opam_files true)

(authors "Piotr Borek <piotrborek@op.pl>")

(maintainers "Piotr Borek <piotrborek@op.pl>")

(package
    (name jpeg2epub)
    (synopsis "epub from jpeg generator")
    (description "epub from jpeg generator")
    (depends
        (ocaml (>= 5.4))
        (eio_main (>= 1.3))
        (ANSITerminal (>= 0.8.5))
        (climate (>= 0.9.0))
        (ppx_deriving (>= 6.1.1))
        (alcotest :with-test)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
