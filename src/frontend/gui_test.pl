:- use_module(library(pce)).

run :-
    new(Window, dialog('Simple GUI')),
    send(Window, append(button('Click Me', message(@prolog, hello)))),
    send(Window, open).

hello :-
    writeln('Button was clicked!').