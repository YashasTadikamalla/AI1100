% ipl 2021 outcomes

%
% team(x) means that x is a team that played in ipl 2021.
%

team(csk).
team(mi).
team(rr).
team(rcb).
team(srh).
team(kkr).
team(dc).
team(pbks).

%
% won(team_X,team_Y) means team_X won against team_Y.
%

won(rcb,mi).
won(dc,csk).
won(kkr,srh).
won(pbks,rr).
won(mi,kkr).
won(rcb,srh).
won(rr,dc).
won(csk,pbks).
won(mi,srh).
won(rcb,kkr).
won(dc,pbks).
won(csk,rr).
won(dc,mi).
won(srh,pbks).
won(csk,kkr).
won(rcb,rr).
won(pbks,mi).
won(rr,kkr).
won(csk,rcb).
won(dc,srh).
won(kkr,pbks).
won(rcb,dc).
won(csk,srh).
won(mi,rr).
won(dc,kkr).
won(pbks,rcb).
won(mi,csk).
won(rr,srh).
won(dc,pbks).

%
% no_of_wins(X,NW) means Team X has won NW number of matches.
%

no_of_wins(X,NW) :- findall(1,won(X,_),LIST), length(LIST, NW).
% whenever won(X,_) is satisfied, 1 is appended to the list LIST.
% i.e, whenever X wins a match, 1 is appended to LIST.
% the length of LIST is stored in NW, i.e, LIST has NW 1's.
% Hence, NW is the number of matches won by X.


%
% no_of_loses(X,NL) means Team X has lost NL number of matches.
%

no_of_loses(X,NL) :- findall(0,won(_,X),LIST), length(LIST, NL).
% whenever won(_,X) is satisfied, 0 is appended to the list LIST.
% i.e, whenever X loses a match, 0 is appended to LIST.
% the length of LIST is stored in NL, i.e, LIST has NL 0's.
% Hence, NL is the number of matches lost by X.


%
% category(X,1) means team X belongs to category 1
%

category(X,1) :- team(X), no_of_wins(X,NW), NW=:=1.
% if X is a team, and it won exactly one match,
% THEN X belongs to category 1.


%
% category(X,2) means team X belongs to category 2
%

category(X,2) :- team(X), no_of_wins(X,NW), NW>1, no_of_loses(X,NL), NL>=1.
% if X is a team, and it won some matches, and lost some matches,
% THEN X belongs to category 2.


%
% category(X,3) means team X belongs to category 3
%

category(X,3) :- team(X), no_of_wins(X,NW), NW>0, no_of_loses(X,NL), NL=:=0.
% if X is a team, and it did not lose any match, and won all its matches,
% THEN X belongs to category 3.



% ANSWERS to some test cases
%
%?- category(mi,X).
%X = 2 ;
%false.
%
%?- category(X,2).
%X = csk ;
%X = mi ;
%X = rr ;
%X = rcb ;
%X = kkr ;
%X = dc ;
%X = pbks.
%
%?- category(mi,2).
%true.
%
%?- category(mi,1).
%false.
%
%?- category(mi,3).
%false.
