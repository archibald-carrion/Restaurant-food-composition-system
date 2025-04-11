# :- prolog_load_context(directory, Dir),
#    atom_concat(Dir, '/../xpce/prolog/lib', XPCEPath), 
#    asserta(user:file_search_path(library, XPCEPath)).

:- use_module(library(pce)).

run :-
    new(Window, dialog('Simple GUI')),
    send(Window, append(button('Click Me', message(@prolog, hello)))),
    send(Window, open).

hello :-
    writeln('Button was clicked!').