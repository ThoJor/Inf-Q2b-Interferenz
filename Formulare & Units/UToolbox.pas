unit UToolbox;

interface

function FrequenzInWellenlaenge (f:real):real;
function AbstandMaxima (a,lambda:real) :real;

implementation

uses Math;

const KLichtgeschwindigkeit= 299792458;                                         //Lichtgeschwindigkeit in Meter pro Sekunde

//Umrechnung einer �bergebenen Frequenz f in die zugeh�rige Wellenl�nge
function FrequenzInWellenlaenge (f:real):real;
begin
  result:=KLichtgeschwindigkeit/f;
end;

//Berechnung des Abstands der Maxima 0. und 1. Ordnung auf dem Schirm mit �bergebenem Abstand a zwischen Schirm und Blende sowie �bergebener Wellenl�nge lambda
function AbstandMaxima (a,lambda:real) :real;
begin
  result:= a*tan(arcsin(lambda));
end;


end.
