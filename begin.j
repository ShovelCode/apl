table=: 1 : '[by]over x./'
by=: ' '&;@,.@[ ,. ]	
over=: ({.;}.)@":@,	
am=: +/ % #
pos=: >: @ i.
each=: &.>

fr=: +/"1 @ (=/)
frtab=: [,.fr
nubfr=: +/"1 @ =
nubtab=:  ~. ,. nubfr

cc=: * +/ @: % @: pos
rnd=: <.@(0.5&+)
sort=: /:~

ccsim=: 3 : 0
n=. y.
r=. i. 0
while. n > # ~. r do.
   r=. r, ?n
end.
>:r
)

ccs=: (#@ccsim)"0 @ #

ccbar=: 3 : 0
pd 'reset'
pd 'type bar'
pd 'title Coupon Collector''s Problem'
pd 'xcaption Sample Size'
pd 'ycaption Frequency'
pd y.
pd 'show'
pd 'clip'
)

WDdisplay=: 3 : 0
;(<"1 (6.0&": y.)), each LF
)

WDrb=: 3 : 0
rb=. ;:'rb00 rb01 rb02 rb03 rb04 rb05 rb06 rb07 rb08 rb09'
x=: wd 'qd;'
(((({."1 x) i. ($y.) {. rb) { {:"1 x) = <,'1') # y.
)

WDname=: 3 : 0
(". & >) (({."1 t) e. y.) # {:"1 t=. wd 'qd;'
)

WinEx7=: 0 : 0
pc winex7;
xywh 5 8 75 52;cc input groupbox;cn " Input ";
xywh 10 20 20 10;cc coupons edit;
xywh 35 20 30 10;cc cname static;cn "Coupons";
xywh 10 40 20 10;cc reps edit;
xywh 35 40 40 10;cc rname static;cn "Repetitions";
xywh 5 70 75 90;cc output groupbox;cn " Output ";
xywh 10 82 30 10;cc exp edit;
xywh 45 82 25 10;cc expname static;cn "Exp. mean";
xywh 10 102 30 10;cc obs edit;
xywh 45 102 30 10;cc obsname static;cn "Obs. mean";
xywh 10 122 30 10;cc min edit;
xywh 45 122 25 10;cc minname static;cn "Minumum";
xywh 10 142 30 10;cc max edit;
xywh 45 142 25 10;cc maxname static;cn "Maximum";
xywh 102 10 50 75;cc frtable editm ws_border ws_vscroll;
xywh 90 90 75 28;cc frame groupbox;cn "Frequencies";
xywh 100 98 30 14;cc rb00 radiobutton;cn "Range";
xywh 133 98 30 14;cc rb01 radiobutton group;cn "Nub";
xywh 110 125 34 14;cc ok button;cn "OK";
xywh 110 145 34 14;cc cancel button;cn "Cancel";
pas 6 6;pcenter;
rem form end;
)

winex7_run=: 3 : 0
wd WinEx7
wd 'set coupons *', '   0 '
wd 'set reps *', '   0 '
wd 'setfont frtable "MS Sans Serif" 11 bold;'
('N R')=: WDname ;:'coupons reps'
CCtable=: 0 8$''
wd 'pshow;'
)

winex7_ok_button=: 3 : 0
Simulation WDrb 0 1
)

Simulation=: 3 : 0
('N R')=. WDname ;:'coupons reps'
wd 'set exp *',''
wd 'set obs *',''
wd 'set min *',''
wd 'set max *',''
wd 'set exp *', 6.1&":cc N
wd 'set frtable *',WDdisplay i. 0 2
if. R > 0 do.
   S=. R ccs N
   wd 'set obs *',6.1&":am S
   wd 'set min *',6.0&":<./S
   wd 'set max *',6.0&":>./S
   if. y. do.
                CCtable=: nubtab sort S
          else.
                range=: 0, pos >./S
                CCtable=: range frtab S
   end.
   wd 'set frtable *',WDdisplay CCtable
end.
)

winex7_cancel_button=: 3 : 0
wd 'pclose;'
)
