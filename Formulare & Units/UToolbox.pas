unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (e,d,lambda,n:real) :real;
function WellenlaengeInFrequenz (lambda: real):real;
function Intensitaet_Doppelspalt(a,b,e,lambda,x:real):real;
function Intensitaet_Gitter(a,b,e,lambda,x:real):real;

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

function Intensitaet_Doppelspalt(a,b,e,lambda,x:real):real;     //a = Spaltabstand    b = Spaltbreite   e = Abstand Blende Schrim
begin
  result:=Power(((sin(pi*(b/lambda)*sin(arctan(x/e))))/(pi*(b/lambda)*sin(arctan(x/e)))),(2))*Power(cos(pi*(a/lambda)*sin(arctan(x/e))),(2));
end;

function Intensitaet_Gitter(a,b,e,lambda,x:real):real;
begin
  result:=0;
end;

end.
