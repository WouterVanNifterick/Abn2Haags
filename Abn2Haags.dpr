program Abn2Haags;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Character,
  System.RegularExpressions,
  WvN.Console,
  Abn2Haags.Tokenizer in 'Abn2Haags.Tokenizer.pas',
  Abn2Haags.Translator in 'Abn2Haags.Translator.pas',
  Abn2Haags.Language in 'Abn2Haags.Language.pas';

const
  OhOh =
    'Ik zou best nog wel een keertje net als vroeger in Moerwijk willen wonen'+sLineBreak+
    'Na het eten een partijtje voetbal in de tuin de ouders langs de lijn'+sLineBreak+
    'En in december met de hele buurt op jacht, om kerstbomen te rauzen'+sLineBreak+
    'Op ouderjaars avond een fikkie stoken, vooral die autobanden rookten fijn'+sLineBreak+
    ''+sLineBreak+
    'Ik zou best nog wel een keertje met die ouwe naar ADO willen kijken'+sLineBreak+
    'In het Zuiderpark de Langezij een warme worst, supporters om je heen'+sLineBreak+
    'Lekker kankeren op Theo van de Burch en die lange van Vianen'+sLineBreak+
    'Want bij elke lage bal dan dook die eikel er steevast over heen!'+sLineBreak+
    ''+sLineBreak+
    'ref.'+sLineBreak+
    'Oh oh Den Haag, mooie stad achter de duinen'+sLineBreak+
    'de Schilderswijk, de Lange Poten en het Plein'+sLineBreak+
    'Oh oh Den Haag, ik zou met niemand willen ruilen'+sLineBreak+
    'Meteen gaan huilen als ik geen Hagenees zou zijn'+sLineBreak+
    ''+sLineBreak+
    'Ik zal best nog wel een keertje net als vroeger, een nachie willen stappen'+sLineBreak+
    'Op m''n puch een wijffie halen en daarna dansen in de Marathon'+sLineBreak+
    'En na afloop op het Rijswijkse plein, een harinkie gaan happen'+sLineBreak+
    'De dag daarna een kater dus naar Scheveningen lekker bakken in de zon'+sLineBreak+
    ''+sLineBreak+
    'Ref.'+sLineBreak+
    'Oh oh Den Haag, mooie stad achter de duinen'+sLineBreak+
    'de Schilderswijk, de Lange Poten en het Plein'+sLineBreak+
    'Oh oh Den Haag, ik zou met niemand willen ruilen'+sLineBreak+
    'Meteen gaan huilen als ik geen Hagenees zou zijn'+sLineBreak+
    ''+sLineBreak+
    'Ik zou best nog wel een keertje, ach wat leg ik toch te dromen, want Den Haag is door die jaren zo veranderd voor mij toch veel te vlug joh'+sLineBreak+
    'Dat nieuw Babylon moest dat er trouwens eigenlijk nou wel zo nodig komen?'+sLineBreak+
    'Zo kom die ooievaar op de Vijverberg dus never nooit meer terug hè?'+sLineBreak+
    ''+sLineBreak+
    'Ref.'+sLineBreak+
    'Oh oh Den Haag, mooie stad achter de duinen'+sLineBreak+
    'De Schilderswijk, de Lange Poten en het Plein'+sLineBreak+
    'Oh oh Den Haag, ik zou met niemand willen ruilen'+sLineBreak+
    'Meteen gaan huilen als ik geen Hagenees zou zijn'+sLineBreak+
    'Meteen gaan huilen als ik geen Hagenees zou zijn'+sLineBreak+
    'Meteen gaan huilen als ik geen Hagenees zou zijn'
  ;

procedure Main;
var Haags:string;
begin
  Console.WindowHeight := 60;
  Haags := Translate(OhOh);
  WritelnC('^G'+Haags);
  Readln;
end;

begin
  try
    Main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
