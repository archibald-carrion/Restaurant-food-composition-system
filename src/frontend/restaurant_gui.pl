
:- use_module(library(pce)).

# add the knowledge base path to the consult

:- consult('../backend/restaurant.pl').

run :-
    new(Window, dialog('Simple GUI')),
    # check if a selected food product is vegan-friendly
    send(Window, append(text_item('Food Product'))),
    send(Window, open).

hello :-
    writeln('Button was clicked!').
