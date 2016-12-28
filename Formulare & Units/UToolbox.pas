unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (a,lambda:real) :real;

implementation

uses Math;

const KLichtgeschwindigkeit= 299792458;                                         //Lichtgeschwindigkeit in Meter pro Sekunde

//Umrechnung einer uebergebenen Frequenz f in die zugehoerige Wellenlaenge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=KLichtgeschwindigkeit/f;
end;

//Berechnung des Abstands der Maxima 0. und 1. Ordnung auf dem Schirm mit uebergebenem Abstand a zwischen Schirm und Blende sowie uebergebener Wellenlaenge lambda
function AbstandMaxima (a,lambda:real) :real;
begin
  result:= a*tan(arcsin(lambda));
end;


end.
