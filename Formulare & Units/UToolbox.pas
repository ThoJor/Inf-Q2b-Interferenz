unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (a,lambda:real) :real;

implementation

uses Math, Konstantenbox;

//Umrechnung einer uebergebenen Frequenz f in die zugehoerige Wellenlaenge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=Konstantenbox.KLichtgeschwindigkeit/f;
end;

//Berechnung des Abstands der Maxima 0. und 1. Ordnung auf dem Schirm mit uebergebenem Abstand a zwischen Schirm und Blende sowie uebergebener Wellenlaenge lambda
function AbstandMaxima (a,lambda:real) :real;
begin
  result:= a*tan(arcsin(lambda));
end;


end.
