unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (e,d,lambda:real) :real;

implementation

uses Math, Konstantenbox;

//Umrechnung einer uebergebenen Frequenz f in die zugehoerige Wellenlaenge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=Konstantenbox.KLichtgeschwindigkeit/f;
end;

//Berechnung des Abstands der Maxima, e = SchirmAbstand (Abstand Spalt-Schirm), d = SpaltAbstand, lambda = Wellenlaenge
function AbstandMaxima (e,d,lambda:real) :real;
begin
  //result:= a*tan(arcsin(lambda));
  result:=e*lambda/d
end;


end.
