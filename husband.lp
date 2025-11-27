%planning horizon
time(0..10).
%-------------------------
%Background knowledge
%Persons
person(m1)
person(m2).
person(m3).
person(w1).
person(w2).
person(w3).
%Gender
man(m1).
man(m2).
man(m3).
woman(w1).
woman(w2).
woman(w3).
%Relationships, namely marriage
husband(m1).
husband(m2).
husband(m3).
wife(w1).
wife(w2).
wife(w3).
%Marriage
married(m1,w1).
married(m2,w2).
married(m3,w3).
%Banks and opposite banks
bank(left).
bank(right).
opposite(left,right).
opposite(right,left).
%-------------------------
%Initial State
at_bank(person(X),left,0) :- person(X).
at_bank(boat,left,0).
%-------------------------
%Inertia
at_bank(X,B,T+1) :- at_bank(X,B,T), time(T), not -at_bank(X,B,T+1).
at_bank(boat,B,T+1) :- at_bank(boat,B,T), time(T), not -at_bank(boat,B,T+1).
%-------------------------
%Goal
goal_reached:- at_bank(person(X),right,T), time(T), person(X).
:- not goal_reached.
%-------------------------

