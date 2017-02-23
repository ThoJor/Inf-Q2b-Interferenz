unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (e,d,lambda,n:real) :real;
function WellenlaengeInFrequenz (lambda: real):real;
function Intensitaet_Einzelspalt(b,e,lambda,x:real):real;
function Intensitaet_Doppelspalt(a,b,e,lambda,x:real):real;
function Intensitaet_Gitter(a,b,e,n,lambda,x:real):real;
function RundeAufStelle(zahl: real; stellen: integer): real;
function Intervall_Einzelspalt(schritte:Integer;zoom,b,e,lambda,x:real):real;
function Intervall_Doppelspalt(schritte:Integer;zoom,a,b,e,lambda,x:real):real;
function Intervall_Gitter(schritte:Integer;zoom,a,b,e,n,lambda,x:real):boolean;
function MaximaCheck_Gitter(a,e,wellenlaenge,x:real):boolean;

implementation

uses Math, Konstantenbox;

//Umrechnung einer uebergebenen Frequenz f in die zugehoerige Wellenlaenge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=Konstantenbox.KLichtgeschwindigkeit/f;
end;

//Umrechnung einer uebergebenen Wellenlaenge lambda in die zugehoerige Frequenz
function WellenlaengeInFrequenz(lambda:real):real;
begin
  result := Konstantenbox.KLichtgeschwindigkeit/lambda;
end;

//Berechnung des Abstands der Maxima, e = SchirmAbstand (Abstand Spalt-Schirm), d = SpaltAbstand, lambda = Wellenlaenge, n = Anzahl des Maxima
function AbstandMaxima (e,d,lambda,n:real) :real;
begin
  if ((lambda*n)/d <= 1) then
    result:= e * tan(arcsin((lambda*n)/d)) Else
    result:= -1;
end;

function Intensitaet_Einzelspalt(b,e,lambda,x:real):real;     //b = Spaltbreite   e = Abstand Blende Schrim
begin
  if x<>0 then
    result:=Power(((sin(pi*b*sin(arctan(x/e))/lambda))/(pi*b*sin(arctan(x/e))/lambda)),(2)) else
    result:=0;
end;

function Intensitaet_Doppelspalt(a,b,e,lambda,x:real):real;     //a = Spaltabstand    b = Spaltbreite   e = Abstand Blende Schrim
begin
  if x<>0 then
    result:=Power(((sin(pi*(b/lambda)*sin(arctan(x/e))))/(pi*(b/lambda)*sin(arctan(x/e)))),(2))*Power(cos(pi*(a/lambda)*sin(arctan(x/e))),(2)) else
    result:=0;
end;

function Intensitaet_Gitter(a,b,e,n,lambda,x:real):real;        //a = Spaltabstand = Gitterkonstante    b = Spaltbreite   e = Abstand Blende Schrim
begin
  if x<>0 then
    result:=Power((((sin(pi*(b/lambda)*sin(arctan(x/e))))/(pi*(b/lambda)*sin(arctan(x/e))))*((sin(n*pi*(a/lambda)*sin(arctan(x/e))))/sin((pi*(a/lambda)*sin(arctan(x/e)))))),(2)) else
    result:=0;
end;

function MaximaCheck_Gitter(a,e,wellenlaenge,x:real):boolean;
var n:real;
begin
  n:=Rundeaufstelle((a*sin(arctan(x/e))/wellenlaenge),2);
  if (sqrt(power(frac(n),2))<0.1) then
    Result:=true else
    result:=false;
end;

function RundeAufStelle(zahl: real; stellen: integer): real;
var multi: double;
begin
  multi:=IntPower(10, stellen);
  zahl:=round(zahl*multi);
  result:=zahl/multi;
end;

function Intervall_Einzelspalt(schritte:Integer;zoom,b,e,lambda,x:real):real;
var i: Integer; karl:real;
begin
  karl:=0;
  for i := 0 to (schritte-1) do
    begin
      karl:=karl+Intensitaet_Einzelspalt(b,e,lambda,(x+zoom*((i/schritte)-0.5)));
    end;
    result:=karl/schritte;
end;

function Intervall_Doppelspalt(schritte:Integer;zoom,a,b,e,lambda,x:real):real;
var i: Integer; karl:real;
begin
  karl:=0;
  for i := 0 to (schritte-1) do
    begin
      karl:=karl+Intensitaet_Doppelspalt(a,b,e,lambda,(x+zoom*((i/schritte)-0.5)));
    end;
    result:=karl/schritte;
end;

function Intervall_Gitter(schritte:Integer;zoom,a,b,e,n,lambda,x:real):boolean;
var i: Integer; karl,yvor,ynach,y:real;
begin
  {karl:=0;
  for i := 0 to (schritte-1) do
    begin
      karl:=karl+Intensitaet_Gitter(a,b,e,n,lambda,(x+zoom*((i/schritte)-0.5)));
    end;
    result:=karl/schritte;}

    yvor:=0;

    result:=false;

    for i := 0 to schritte do
      begin
        ynach:=Intensitaet_Gitter(a,b,e,n,lambda,(x+zoom*((i/(schritte+1))-0.5)));
        y:=Intensitaet_Gitter(a,b,e,n,lambda,(x+zoom*((i/(schritte))-0.5)));
        if (yvor<y) and (ynach<y) then
          result:=true;
        yvor:=y;
      end;

end;

end.
