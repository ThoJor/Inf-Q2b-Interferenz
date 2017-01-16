unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (e,d,lambda,n:real) :real;
function WellenlaengeInFrequenz (lambda: real):real;

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
  //result:= a*tan(arcsin(lambda));
  //result:=e*lambda/d


  if ((lambda*n)/d <= 1) then
    result:= e * tan(arcsin((lambda*n)/d))
end;


end.
