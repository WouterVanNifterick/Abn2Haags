program Abn2Haags;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Character,
  System.RegularExpressions,
  WvN.Console;

const
  TEXT =
//  TEXT = 'Mensen dat het met een "te fors postuur" mogen niet meer van het in de erewacht staan tijdens de dodenherdenking  op de Waalsdorpervlakte   in Den Haag. Dit komt omdat de lokale  vereniging achter de herdenking  klachten hierover   heeft binnengekregen.' + #13#10
//          Mense  met un  "te fors postuâh" mauge nie  meâh in de erewach  staan tèdes   de daudeheâhdenking op de Waalsdorrepâhvlakte in De Haag.  Dit komp omdat de laukale vereniging achtâh de heâhdenking klachte  hieâhauvâh hep   binnegekreigûh.
//          Mense  met een "te fogs postuah" mauge niet meâh in de erewach staan tèdes de daudenherdenking  op de Waalsdorrepervlakte   in Den Haag. Dit komp omdat de lokale  vereniging achtâh de herdenking  klachte hierover   hep binnengekrege.
//    'Krijg nou een hartverzakking met je ondergeschoven geelzuchtkop, klootviool'
  'De wereld is een pijp kaneel, je zuigt er aan met pijn in je keel.'
  ;


type
  TTokenType = (ttOther, ttWhiteSpace, ttWord, ttPunctuation, ttTranslated, ttDeleted);

const
  TTokenTypeStr:array[TTokenType] of string = ('Other', 'WhiteSpace', 'Word', 'Punctuation','Translated','Deleted');

type
  TToken = record
    TokenType: TTokenType;
    Value: string;
  end;

  TTokens = TArray<TToken>;

function TranslateWord(const aToken:TToken):TToken;
var W:string;

  procedure ReplRegEx(var X:string; const aPattern,aReplacement:string);
  var Y:string;
  begin
    Y := X;
    Y := TRegEx.Replace(Y, aPattern, aReplacement);
    if X <> Y then
    begin
      if Y<>'' then
        X := Y;
      Result.TokenType := ttTranslated;
      Result.Value := X;
    end;
  end;
  procedure ReplWholeWord(const S,ABN,Haags:string;out r:Boolean);
  begin
    if SameText(S,ABN) then
    begin
      Result.TokenType := ttTranslated;
      Result.Value := Haags;
      r := true;
    end
    else
      r := False;
  end;

  procedure ReplaceSubstr(const S,R:string);
  begin
    if W.ToLower.Contains(S.ToLower) then
    begin
      W := W.Replace(S.ToLower,R,[rfReplaceAll, rfIgnoreCase]);
      Result.Value := W;
      Result.TokenType := ttTranslated;
    end;
  end;

var Res:boolean;
begin
  W := aToken.Value;
  Result := aToken;

  ReplWholeWord(W,'waarom'      ,'warom',res);   if Res then Exit;
  ReplWholeWord(W,'mazzel'      ,'mazzol',res);   if Res then Exit;
  ReplWholeWord(W,'kan'      ,'ken',res);   if Res then Exit;
  ReplWholeWord(W,'kun'      ,'ken',res);   if Res then Exit;
  ReplWholeWord(W,'zo'       ,'zau',res);   if Res then Exit;
  ReplWholeWord(W,'ligt'     ,'leg',res);  if Res then    Exit;
  ReplWholeWord(W,'lig'      ,'leg',res);   if Res then Exit;
  ReplWholeWord(W,'liggen'   ,'legge',res);   if Res then Exit;
  ReplWholeWord(W,'eens'     ,'es',res);   if Res then Exit;
  ReplWholeWord(W,'heeft'    ,'hep',res);  if Res then Exit;
  ReplWholeWord(W,'aan'      ,'an',res);   if Res then Exit;
  ReplWholeWord(W,'nou'      ,'nâh',res);   if Res then Exit;
  ReplWholeWord(W,'een'      ,'un',res);   if Res then Exit;
  ReplWholeWord(W,'chips'    ,'sjips',res);   if Res then Exit;
  ReplWholeWord(W,'tram'     ,'trem',res);   if Res then Exit;
  ReplWholeWord(W,'flat'     ,'flet',res);   if Res then Exit;
  ReplWholeWord(W,'hoofd'    ,'hauf',res);   if Res then Exit;
  ReplWholeWord(W,'delft'    ,'delluf',res);   if Res then Exit;
  ReplWholeWord(W,'geld'     ,'poen',res);   if Res then Exit;
  ReplWholeWord(W,'officiele','offesjeile',res);   if Res then Exit;
  ReplWholeWord(W,'ophouden' ,'afnokke',res);   if Res then Exit;
  ReplWholeWord(W,'gek'      ,'wâhs',res);   if Res then Exit;
  ReplWholeWord(W,'eten'     ,'nassen',res);   if Res then Exit;
  ReplWholeWord(W,'moet'     ,'mot',res);   if Res then Exit;
  ReplWholeWord(W,'moeten'   ,'motte',res);   if Res then Exit;
  ReplWholeWord(W,'achterlijk','megoâhl',res);   if Res then Exit;
  ReplWholeWord(W,'gozer'     ,'gauzâh',res);   if Res then Exit;
  ReplWholeWord(W,'helemaal'  ,'heilemaal',res);   if Res then Exit;
  ReplWholeWord(W,'welnee'    ,'welnei',res);   if Res then Exit;
  ReplWholeWord(W,'verleden'    ,'veleide',res);   if Res then Exit;
  ReplWholeWord(W,'origineel'    ,'orresjineel',res);   if Res then Exit;
//  ReplWholeWord(W,'alleen'    ,'enkelt',res);   if Res then Exit;
  ReplWholeWord(W,'vanavond'    ,'venavond',res);   if Res then Exit;
  ReplWholeWord(W,'hagenees'    ,'hageneis',res);   if Res then Exit;
  ReplWholeWord(W,'weinig'    ,'wènag',res);   if Res then Exit;
  ReplWholeWord(W,'portie'    ,'pogsie',res);   if Res then Exit;
  ReplWholeWord(W,'vertrouwen'    ,'vetrâhwuh',res);   if Res then Exit;
  ReplWholeWord(W,'geleden'    ,'geleije',res);   if Res then Exit;
  ReplWholeWord(W,'mongool'    ,'megaul',res);   if Res then Exit;

  if W.Length>4 then
    ReplRegEx(W,'(.*[bdfgklmnprstvwz])(en)$','\1e');

  ReplRegEx(W,'(.*[bcdfghjklmnprstvwz])(o)([bcdfghjklmnpqrstvwxz])([aeuio])(.*)$','\1\2\3\4\5');
//  ReplRegEx(W,'(.*)(sch)([eoai])(.*)$','\1sg\3\4');
  ReplRegEx(W,'(.*)([dfhkp])elijk$','\1\2elek');
  ReplRegEx(W,'(.*)([dfhkp])elijke$','\1\2elekke');
  ReplRegEx(W,'(.*)(eer)$','\1eâh');
  ReplRegEx(W,'(.*)(t|v)(er)$','\1\2âh');
  ReplRegEx(W,'(.*)(oer)$','\1oeâh');
  ReplRegEx(W,'(.*)(uur)$','\1uâh');
//  ReplRegEx(W,'(.*)(oor)$','\1oâh');
  ReplRegEx(W,'(.*)(aar)$','\1aah');
  ReplRegEx(W,'(.*)(omt)$','\1omp');
  ReplRegEx(W,'(.*)(cht)$','\1ch');
  ReplRegEx(W,'(.*)(ens)$','\1es');
  ReplRegEx(W,'(.*)(nkt)$','\1nk');
  ReplRegEx(W,'(.*)(ordt)$','\1ogdt');
  ReplRegEx(W,'(.*)(lig)$','\1lag');
  ReplRegEx(W,'(.*)(oude)$','\1âhwe');
  ReplRegEx(W,'(.*)(pen)$','\1pûh');
  ReplRegEx(W,'(.*)(tig)$','\1tag');
  ReplRegEx(W,'(.*)(igt)$','\1ig');
  ReplRegEx(W,'(.*)(ord)$','\1ogd');
  ReplRegEx(W,'(.*)(ors)$','\1ogs');
  ReplRegEx(W,'(.*)(unch)$','\1uns');
  ReplRegEx(W,'(.*)(ur)([pkf])$','\1urre\3');
  ReplRegEx(W,'(.*)(ier)$','\1iâh');
  ReplRegEx(W,'(.*)(nig)$','\1nag');
  ReplRegEx(W,'(.*)(nair)$','\1nèâh');
  ReplRegEx(W,'(.*)(fd)$','\1f');
  ReplRegEx(W,'(.*)(b)$','\1p');
  ReplRegEx(W,'(.*)(ijst)$','\1ès');
  ReplRegEx(W,'(.*)([eao]+)ft$','\1\2f');

  ReplRegEx(W,'(.*)([aoiuenrsk])tie$','\1\2sie');

  ReplaceSubstr('eider','èijâh');


  ReplaceSubstr('ouw','âh');
  ReplaceSubstr('auw','âh');

  ReplaceSubstr('ij','è');
  ReplaceSubstr('orp','orrep');
  ReplaceSubstr('ove','auve');
  ReplaceSubstr('ege','eige');
  ReplaceSubstr('oge','auge');
  ReplaceSubstr('ode','aude');
  ReplaceSubstr('ope','aupe');
  ReplaceSubstr('icht','ich');
  ReplaceSubstr('oor','oâh');
  ReplaceSubstr('der','dâh');
  ReplaceSubstr('elf','ellef');
  ReplaceSubstr('alf','alluf');
  ReplaceSubstr('olk','ollek');
  ReplaceSubstr('alk','allek');
  ReplaceSubstr('ulk','ullek');
  ReplaceSubstr('art','agt');
  ReplaceSubstr('erpe','errepe');
  ReplaceSubstr('ct','kt');
  ReplaceSubstr('ua','uwa');
  ReplaceSubstr('ei','è');
  ReplaceSubstr('ui','ùi');
  ReplaceSubstr('au','âh');
  ReplaceSubstr('ou','âh');
  ReplaceSubstr('oo','au');
  ReplaceSubstr('eer','eâh');
  ReplaceSubstr('eel','eil');
  ReplaceSubstr('eel','eil');
  ReplaceSubstr('ort','ogt');
  ReplaceSubstr('ook','auk');
  ReplaceSubstr('or','oâh');
  ReplaceSubstr('erm','errem');
  ReplaceSubstr('ucht','uch');
  ReplaceSubstr('verza','veza');
  ReplaceSubstr('product','prauduk');
  ReplaceSubstr('politiek','polletiek');
  ReplaceSubstr('show','sjow');
  ReplaceSubstr('ubt','upt');
  ReplaceSubstr('ote','aute');


  if aToken.Value <> '' then
    if Result.Value <> '' then
      if aToken.Value[1].IsUpper then
        Result.Value[1] := Result.Value[1].ToUpper;
end;

function Tokenize(const s: string): TTokens;
var
  c    : Char;
  i    : Integer;
  cNext: Char;
  cPrev: Char;
  t    : TToken;
  procedure PushToken;
  begin
    Result      := Result + [t];
    t.TokenType := ttWord;
    t.Value     := '';
  end;

begin
  t.TokenType := ttWord;
  t.Value     := '';

  for i := 1 to Length(s) do
  begin
    c := s[i];
    if i > 1 then
      cPrev := s[i - 1]
    else
      cPrev := Char(0);

    if i < Length(s) - 1 then
      cNext := s[i + 1]
    else
      cNext := Char(0);

    if c.IsWhiteSpace then
    begin
      PushToken;
      t.TokenType := ttWhiteSpace;
      t.Value     := t.Value + c;
      PushToken;
      Continue;
    end;

    if c.IsPunctuation then
    begin
      if (not cPrev.IsLetter) or (not cNext.IsLetter) then
      begin
        PushToken;
        t.Value     := t.Value + c;
        t.TokenType := ttPunctuation;
        PushToken;
        Continue;
      end
      else
        t.Value := t.Value + c;
      Continue;
    end;
    if not c.IsLetter then
      t.TokenType := ttOther;

    t.Value := t.Value + c;
  end;

  if t.Value.Length > 0 then
    PushToken;
end;

function CombineTokens(aTokens:TTokens):TTokens;
var i,j:integer;
  t1,t2,tj:TToken;
  function CombineWords(w1: string; w2: string; comb: string):boolean;
  begin
    if SameText(t1.Value, w1) then
      if SameText(t2.Value, w2) then
      begin
        if comb <> '' then
          if t1.Value <> '' then
            if t1.Value[1].IsUpper then
              comb[1] := t1.Value[1].ToUpper;
        t1.Value := comb;
        t1.TokenType := ttTranslated;
        t2.Value := '';
        t2.TokenType := ttDeleted;
        aTokens[J] := t2;
        if J<High(aTokens) then
          if aTokens[J+1].TokenType=ttWhiteSpace then
            aTokens[J+1].TokenType := ttDeleted;
        Exit(True);
      end;
    Result:= False
  end;
begin
  for I := 0 to High(aTokens) do
  begin
    t1 := aTokens[I];
    if I<High(aTokens) then
      if aTokens[I].TokenType = ttWord then
      begin
        for J := I+1 to high(aTokens) do
        begin
          tj := aTokens[J];
          if tj.TokenType <> ttWhiteSpace then
          begin
            t2 := tj;
            if CombineWords('of' ,'ik','offik'   ) then Break;
            if CombineWords('niet' ,'dan','niettan'   ) then Break;
            if CombineWords('hebt' ,'het','heppet'   ) then Break;
            if CombineWords('als' ,'je'  ,'asje'   ) then Break;
            if CombineWords('op'  ,'de'  ,'opte'   ) then Break;
            if CombineWords('als' ,'ik'  ,'azzik'  ) then Break;
            if CombineWords('van' ,'de'  ,'vande'  ) then Break;
            if CombineWords('van' ,'het' ,'vannut' ) then Break;
            if CombineWords('dat' ,'het' ,'dattut' ) then Break;
            if CombineWords('doet','het' ,'doettut') then Break;
            if CombineWords('met' ,'ons' ,'mettons') then Break;
            if CombineWords('Den' ,'Haag','De Haag') then Break;
            if CombineWords('moet' ,'die','mottie') then Break;
            if CombineWords('moet' ,'hij','mottie') then Break;
            if CombineWords('moet' ,'zij','mot ze') then Break;
            if CombineWords('dat' ,'je','dajje') then Break;
            if CombineWords('ken' ,'ik','kennik') then Break;
            if CombineWords('kan' ,'ik','kennik') then Break;
            if CombineWords('ken' ,'je','kejje') then Break;
            if CombineWords('kan' ,'je','kejje') then Break;
            if CombineWords('kun' ,'je','kejje') then Break;
            if CombineWords('kun' ,'je','kejje') then Break;
            if CombineWords('dacht' ,'het','dachut') then Break;
            if CombineWords('van' ,'jou','vajjâh') then Break;
            if CombineWords('als' ,'er','alster') then Break;
            if CombineWords('je' ,'zelf','je ège') then Break;
            if CombineWords('val' ,'ik','vallik') then Break;
            if CombineWords('bent' ,'een','bennun') then Break;
            if CombineWords('is' ,'een','issun') then Break;
          end;
        end;
      end;
    if t1.TokenType <> ttDeleted then
      Result := Result + [t1];
  end;
end;

function TranslateSingleWords(const aTokens:TTokens):TTokens;
var t:TToken;
begin
  for t in aTokens do
  begin
    if t.TokenType=ttWord then
      Result := Result + [TranslateWord(t)]
    else
      Result := Result + [t];
  end;

end;

procedure Main;
var
  words: TArray<string>;
  m    : TMatch;
  t    : TToken;
  Tokens:TTokens;
begin
  Console.WindowHeight := 100;
  Tokens := Tokenize(TEXT);
  Tokens := CombineTokens(Tokens);
  Tokens := TranslateSingleWords(Tokens);
  for t in Tokens do
  begin
//    Writeln(TTokenTypeStr[t.TokenType]:15, ' ',t.Value);
    Write(t.Value);
  end;

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
