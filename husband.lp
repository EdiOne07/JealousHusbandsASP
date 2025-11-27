%planning horizon
time(0..10).
%-------------------------
%Background knowledge
%Persons
person(m1).
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
at_bank(left,X,0) :- person(X).
at_bank(left,boat,0).
%-------------------------
%Inertia
at_bank(B,X,T+1) :- at_bank(B,X,T), time(T), not -at_bank(B,X,T+1).
at_bank(B,boat,T+1) :- at_bank(B,boat,T), time(T), not -at_bank(B,boat,T+1).

%-------------------------
%Goal
goal_reached :- at_bank(right,m1,T), at_bank(right,w1,T), at_bank(right,m2,T), at_bank(right,w2,T), at_bank(right,m3,T), at_bank(right,w3,T), at_bank(right,boat,T).
:- not goal_reached.
%-------------------------
%Action
{cross(P,T):person(P)} <= 2 :- time(T).
:- at_bank(B,boat,T), at_bank(B1,P,T), cross(P,T), opposite(B,B1), person(P),time(T).
at_bank(B1,P,T+1):-cross(P,T), at_bank(B,P,T),opposite(B,B1), time(T).
at_bank(B1,boat,T+1):-cross(P,T), at_bank(B,boat,T),opposite(B,B1), time(T).
-at_bank(B,P,T+1):-cross(P,T), at_bank(B,P,T),time(T).
-at_bank(B,boat,T+1):-cross(P,T), at_bank(B,boat,T),time(T).
:- cross(P,T), cross(Q,T),man(P),woman(Q), not married(P,Q), time(T).
:- at_bank(B,M,T),at_bank(B,Q,T),man(M),woman(Q),man(H),not at_bank(B,H,T),married(H,Q),H!=M,time(T).
#show cross/2.