unit UFarbtabelle;

interface
var Farben: Array[1..80,0..1] of string;                     //2D Statisches Array mit 80 Zeilen und 2 Spalten
function Farbe(Wellenlaenge: string): string;

implementation

procedure Farbtabelle;
begin                                                        //Farben mit Wellenlaengen 678.37nm bis 435.01 nm
  Farben[1,0]:='610000';  Farben[1,1]:='780.00';
  Farben[2,0]:='6d0000';  Farben[2,1]:='775.00';
  Farben[3,0]:='770000';  Farben[3,1]:='770.00';
  Farben[4,0]:='820000';  Farben[4,1]:='765.00';
  Farben[5,0]:='8d0000';  Farben[5,1]:='760.00';
  Farben[6,0]:='970000';  Farben[6,1]:='755.00';
  Farben[7,0]:='a10000';  Farben[7,1]:='750.00';
  Farben[8,0]:='ab0000';  Farben[8,1]:='745.00';
  Farben[9,0]:='b50000';  Farben[9,1]:='740.00';
  Farben[10,0]:='be0000'; Farben[10,1]:='735.00';
  Farben[11,0]:='c80000'; Farben[11,1]:='730.00';
  Farben[12,0]:='d10000'; Farben[12,1]:='725.00';
  Farben[13,0]:='db0000'; Farben[13,1]:='720.00';
  Farben[14,0]:='e40000'; Farben[14,1]:='715.00';
  Farben[15,0]:='ed0000'; Farben[15,1]:='710.00';
  Farben[16,0]:='f60000'; Farben[16,1]:='705.00';
  Farben[17,0]:='ff0000'; Farben[17,1]:='700.00';
  Farben[18,0]:='ff0000'; Farben[18,1]:='695.00';
  Farben[19,0]:='ff0000'; Farben[19,1]:='690.00';
  Farben[20,0]:='ff0000'; Farben[20,1]:='685.00';
  Farben[21,0]:='ff0000'; Farben[21,1]:='680.00';
  Farben[22,0]:='ff0000'; Farben[22,1]:='675.00';
  Farben[23,0]:='ff0000'; Farben[23,1]:='670.00';
  Farben[24,0]:='ff0000'; Farben[24,1]:='665.00';
  Farben[25,0]:='ff0000'; Farben[25,1]:='660.00';
  Farben[26,0]:='ff0000'; Farben[26,1]:='655.00';
  Farben[27,0]:='ff0000'; Farben[27,1]:='650.00';
  Farben[28,0]:='ff0000'; Farben[28,1]:='645.00';
  Farben[29,0]:='ff2100'; Farben[29,1]:='640.00';
  Farben[30,0]:='ff3900'; Farben[30,1]:='635.00';
  Farben[31,0]:='ff4f00'; Farben[31,1]:='630.00';
  Farben[32,0]:='ff6300'; Farben[32,1]:='625.00';
  Farben[33,0]:='ff7700'; Farben[33,1]:='620.00';
  Farben[34,0]:='ff8900'; Farben[34,1]:='615.00';
  Farben[35,0]:='ff9b00'; Farben[35,1]:='610.00';
  Farben[36,0]:='ffad00'; Farben[36,1]:='605.00';
  Farben[37,0]:='ffbe00'; Farben[37,1]:='600.00';
  Farben[38,0]:='ffcf00'; Farben[38,1]:='595.00';
  Farben[39,0]:='ffdf00'; Farben[39,1]:='590.00';
  Farben[40,0]:='ffef00'; Farben[40,1]:='585.00';
  Farben[41,0]:='ffff00'; Farben[41,1]:='580.00';
  Farben[42,0]:='f0ff00'; Farben[42,1]:='575.00';
  Farben[43,0]:='e1ff00'; Farben[43,1]:='570.00';
  Farben[44,0]:='d2ff00'; Farben[44,1]:='565.00';
  Farben[45,0]:='c3ff00'; Farben[45,1]:='560.00';
  Farben[46,0]:='b3ff00'; Farben[46,1]:='555.00';
  Farben[47,0]:='a3ff00'; Farben[47,1]:='550.00';
  Farben[48,0]:='92ff00'; Farben[48,1]:='545.00';
  Farben[49,0]:='81ff00'; Farben[49,1]:='540.00';
  Farben[50,0]:='70ff00'; Farben[50,1]:='535.00';
  Farben[51,0]:='5eff00'; Farben[51,1]:='530.00';
  Farben[52,0]:='4aff00'; Farben[52,1]:='525.00';
  Farben[53,0]:='36ff00'; Farben[53,1]:='520.00';
  Farben[54,0]:='1fff00'; Farben[54,1]:='515.00';
  Farben[55,0]:='00ff00'; Farben[55,1]:='510.00';
  Farben[56,0]:='00ff54'; Farben[56,1]:='505.00';
  Farben[57,0]:='00ff92'; Farben[57,1]:='500.00';
  Farben[58,0]:='00ffcb'; Farben[58,1]:='495.00';
  Farben[59,0]:='00ffff'; Farben[59,1]:='490.00';
  Farben[60,0]:='00eaff'; Farben[60,1]:='485.00';
  Farben[61,0]:='00d5ff'; Farben[61,1]:='480.00';
  Farben[62,0]:='00c0ff'; Farben[62,1]:='475.00';
  Farben[63,0]:='00a9ff'; Farben[63,1]:='470.00';
  Farben[64,0]:='0092ff'; Farben[64,1]:='465.00';
  Farben[65,0]:='007bff'; Farben[65,1]:='460.00';
  Farben[66,0]:='0061ff'; Farben[66,1]:='455.00';
  Farben[67,0]:='0046ff'; Farben[67,1]:='450.00';
  Farben[68,0]:='0000ff'; Farben[68,1]:='445.00';
  Farben[69,0]:='2300ff'; Farben[69,1]:='435.00';
  Farben[70,0]:='3d00ff'; Farben[70,1]:='430.00';
  Farben[71,0]:='5400ff'; Farben[71,1]:='425.00';
  Farben[72,0]:='6a00ff'; Farben[72,1]:='420.00';
  Farben[73,0]:='7600ed'; Farben[73,1]:='415.00';
  Farben[74,0]:='7e00db'; Farben[74,1]:='410.00';
  Farben[75,0]:='8200c8'; Farben[75,1]:='405.00';
  Farben[76,0]:='8300b5'; Farben[76,1]:='400.00';
  Farben[77,0]:='8000a1'; Farben[77,1]:='395.00';
  Farben[78,0]:='79008d'; Farben[78,1]:='390.00';
  Farben[79,0]:='6f0077'; Farben[79,1]:='385.00';
  Farben[80,0]:='610061'; Farben[80,1]:='380.00';
end;

function Farbe(Wellenlaenge: string): string;
var
  Farbe_gefunden: Boolean;
  Zaehler: Integer;
begin
  //Variablen zuruecksetzen
  Farbe_gefunden:= false;
  Zaehler:= 0;

  //Hexcode zur Wellenlaenge ermitteln
  repeat
  Inc(Zaehler);
  if Wellenlaenge= Farben[Zaehler,1] then Farbe_gefunden:= true;
  until (Zaehler= 63) or (Farbe_gefunden= true);

  //Wert an aufrufende Prozedur geben
  if Farbe_gefunden= true
    then Result:= Farben[Zaehler,0]
    else Result:= '000000';

end;

end.
