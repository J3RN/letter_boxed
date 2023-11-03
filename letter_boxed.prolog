:- use_module(library(apply)).

:- [words].

solution(Sides, Words) :-
    Sides = [Side1, Side2, Side3, Side4],
    length(Side1, 3), length(Side2, 3), length(Side3, 3), length(Side4, 3),
    Words = [Word1, Word2, Word3, Word4],
    word(Word1), word(Word2), word(Word3), word(Word4),
    string_chars(Word1, Chars1),
    string_chars(Word2, Chars2),
    string_chars(Word3, Chars3),
    string_chars(Word4, Chars4),
    valid_word(Chars1, Sides),
    valid_word(Chars2, Sides),
    valid_word(Chars3, Sides),
    valid_word(Chars4, Sides),
    last(Chars1, L1), first(Chars2, L1),
    last(Chars2, L2), first(Chars3, L2),
    last(Chars3, L3), first(Chars4, L3).

%% Why not stdlib? :(
first(List, Elem) :-
    nth0(0, List, Elem).

%% valid_word(Letters, Sides)
valid_word([L1 | WordRest], Sides) :-
    member(WinSide, Sides),
    member(L1, WinSide),
    delete(Sides, WinSide, NextValid),
    valid_word(WordRest, NextValid, WinSide).

%% valid_word(Letters, ValidSides, OtherSide)
valid_word([], _, _).
valid_word([L1 | WordRest], ValidSides, OtherSide) :-
    member(WinSide, ValidSides),
    member(L1, WinSide),
    delete(ValidSides, WinSide, NextValid),
    valid_word(WordRest, [OtherSide | NextValid], WinSide).
