unit UFarbtabelle;

interface
var Farben: Array[1..80,0..1] of string;                     //2D Statisches Array mit 80 Zeilen und 2 Spalten
function Farbe(Wellenlaenge: string): string;

implementation

procedure Farbtabelle;
begin                                                        //Farben mit Wellenlaengen 678.37nm bis 435.01 nm
  Farben[1,0]:='610000';  Farben[1,1]:='780';
  Farben[2,0]:='6d0000';  Farben[2,1]:='775';
  Farben[3,0]:='770000';  Farben[3,1]:='770';
  Farben[4,0]:='820000';  Farben[4,1]:='765';
  Farben[5,0]:='8d0000';  Farben[5,1]:='760';
  Farben[6,0]:='970000';  Farben[6,1]:='755';
  Farben[7,0]:='a10000';  Farben[7,1]:='750';
  Farben[8,0]:='ab0000';  Farben[8,1]:='745';
  Farben[9,0]:='b50000';  Farben[9,1]:='740';
  Farben[10,0]:='be0000'; Farben[10,1]:='735';
  Farben[11,0]:='c80000'; Farben[11,1]:='730';
  Farben[12,0]:='d10000'; Farben[12,1]:='725';
  Farben[13,0]:='db0000'; Farben[13,1]:='720';
  Farben[14,0]:='e40000'; Farben[14,1]:='715';
  Farben[15,0]:='ed0000'; Farben[15,1]:='710';
  Farben[16,0]:='f60000'; Farben[16,1]:='705';
  Farben[17,0]:='ff0000'; Farben[17,1]:='700';
  Farben[18,0]:='ff0000'; Farben[18,1]:='695';
  Farben[19,0]:='ff0000'; Farben[19,1]:='690';
  Farben[20,0]:='ff0000'; Farben[20,1]:='685';
  Farben[21,0]:='ff0000'; Farben[21,1]:='680';
  Farben[22,0]:='ff0000'; Farben[22,1]:='675';
  Farben[23,0]:='ff0000'; Farben[23,1]:='670';
  Farben[24,0]:='ff0000'; Farben[24,1]:='665';
  Farben[25,0]:='ff0000'; Farben[25,1]:='660';
  Farben[26,0]:='ff0000'; Farben[26,1]:='655';
  Farben[27,0]:='ff0000'; Farben[27,1]:='650';
  Farben[28,0]:='ff0000'; Farben[28,1]:='645';
  Farben[29,0]:='ff2100'; Farben[29,1]:='640';
  Farben[30,0]:='ff3900'; Farben[30,1]:='635';
  Farben[31,0]:='ff4f00'; Farben[31,1]:='630';
  Farben[32,0]:='ff6300'; Farben[32,1]:='625';
  Farben[33,0]:='ff7700'; Farben[33,1]:='620';
  Farben[34,0]:='ff8900'; Farben[34,1]:='615';
  Farben[35,0]:='ff9b00'; Farben[35,1]:='610';
  Farben[36,0]:='ffad00'; Farben[36,1]:='605';
  Farben[37,0]:='ffbe00'; Farben[37,1]:='600';
  Farben[38,0]:='ffcf00'; Farben[38,1]:='595';
  Farben[39,0]:='ffdf00'; Farben[39,1]:='590';
  Farben[40,0]:='ffef00'; Farben[40,1]:='585';
  Farben[41,0]:='ffff00'; Farben[41,1]:='580';
  Farben[42,0]:='f0ff00'; Farben[42,1]:='575';
  Farben[43,0]:='e1ff00'; Farben[43,1]:='570';
  Farben[44,0]:='d2ff00'; Farben[44,1]:='565';
  Farben[45,0]:='c3ff00'; Farben[45,1]:='560';
  Farben[46,0]:='b3ff00'; Farben[46,1]:='555';
  Farben[47,0]:='a3ff00'; Farben[47,1]:='550';
  Farben[48,0]:='92ff00'; Farben[48,1]:='545';
  Farben[49,0]:='81ff00'; Farben[49,1]:='540';
  Farben[50,0]:='70ff00'; Farben[50,1]:='535';
  Farben[51,0]:='5eff00'; Farben[51,1]:='530';
  Farben[52,0]:='4aff00'; Farben[52,1]:='525';
  Farben[53,0]:='36ff00'; Farben[53,1]:='520';
  Farben[54,0]:='1fff00'; Farben[54,1]:='515';
  Farben[55,0]:='00ff00'; Farben[55,1]:='510';
  Farben[56,0]:='00ff54'; Farben[56,1]:='505';
  Farben[57,0]:='00ff92'; Farben[57,1]:='500';
  Farben[58,0]:='00ffcb'; Farben[58,1]:='495';
  Farben[59,0]:='00ffff'; Farben[59,1]:='490';
  Farben[60,0]:='00eaff'; Farben[60,1]:='485';
  Farben[61,0]:='00d5ff'; Farben[61,1]:='480';
  Farben[62,0]:='00c0ff'; Farben[62,1]:='475';
  Farben[63,0]:='00a9ff'; Farben[63,1]:='470';
  Farben[64,0]:='0092ff'; Farben[64,1]:='465';
  Farben[65,0]:='007bff'; Farben[65,1]:='460';
  Farben[66,0]:='0061ff'; Farben[66,1]:='455';
  Farben[67,0]:='0046ff'; Farben[67,1]:='450';
  Farben[68,0]:='0000ff'; Farben[68,1]:='445';
  Farben[69,0]:='2300ff'; Farben[69,1]:='435';
  Farben[70,0]:='3d00ff'; Farben[70,1]:='430';
  Farben[71,0]:='5400ff'; Farben[71,1]:='425';
  Farben[72,0]:='6a00ff'; Farben[72,1]:='420';
  Farben[73,0]:='7600ed'; Farben[73,1]:='415';
  Farben[74,0]:='7e00db'; Farben[74,1]:='410';
  Farben[75,0]:='8200c8'; Farben[75,1]:='405';
  Farben[76,0]:='8300b5'; Farben[76,1]:='400';
  Farben[77,0]:='8000a1'; Farben[77,1]:='395';
  Farben[78,0]:='79008d'; Farben[78,1]:='390';
  Farben[79,0]:='6f0077'; Farben[79,1]:='385';
  Farben[80,0]:='610061'; Farben[80,1]:='380';
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
  until (Zaehler= 80) or (Farbe_gefunden= true);

  //Wert an aufrufende Prozedur geben
  if Farbe_gefunden= true
    then Result:= Farben[Zaehler,0]
    else Result:= '000000';

end;

end.
