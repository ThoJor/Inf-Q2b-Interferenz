unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (a,lambda:real) :real;

implementation

uses Math;

const KLichtgeschwindigkeit= 299792458;                                         //Lichtgeschwindigkeit in Meter pro Sekunde

//Umrechnung einer übergebenen Frequenz f in die zugehörige Wellenlänge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=KLichtgeschwindigkeit/f;
end;

//Berechnung des Abstands der Maxima 0. und 1. Ordnung auf dem Schirm mit übergebenem Abstand a zwischen Schirm und Blende sowie übergebener Wellenlänge lambda
function AbstandMaxima (a,lambda:real) :real;
begin
  result:= a*tan(arcsin(lambda));
end;


end.
