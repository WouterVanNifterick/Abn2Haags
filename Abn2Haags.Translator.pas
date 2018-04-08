unit Abn2Haags.Translator;

interface

uses
  System.SysUtils,
  System.Character,
  System.RegularExpressions,
  Abn2Haags.Tokenizer,
  Abn2Haags.Language
;

type TTokenVisitor=reference to function(aToken:TToken):string;


function Translate(const ABN:string):string;overload;
function TranslateToStructure(const ABN:string):TTokens;overload;

implementation

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
  function ReplWholeWord(const S,ABN,Haags:string;var Token:TToken):Boolean;
  begin
    if SameText(S,ABN) then
    begin
      Token.TokenType := ttTranslated;
      Token.Value := Haags;
      Result := true;
    end
    else
      Result := False;
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

var
  trans:TTranslation;
begin
  W := aToken.Value;
  Result := aToken;

  // Find entire words to translate. Quit translation if successully translated
  for trans in WholeWords do
    if ReplWholeWord(W,trans.ABN, trans.Haags,Result) then
      Exit;


  if W.Length>4 then
    ReplRegEx(W,'(.*[bdfgklmnprstvwz])(en)$','\1e');

  ReplRegEx(W,'(.*[bcdfghjklmnprstvwz])(o)([bcdfghjklmnpqrstvwxz])([aeuio])(.*)$','\1\2\3\4\5');
//  ReplRegEx(W,'(.*)(sch)([eoai])(.*)$','\1sg\3\4');
  ReplRegEx(W,'(.*)([dfhkp])elijk$','\1\2elek');
  ReplRegEx(W,'(.*)([dfhkp])elijke$','\1\2elekke');
  ReplRegEx(W,'(.*)(eer)$','\1eâh');
  ReplRegEx(W,'(.*)(uur)$','\1uâh');
//  ReplRegEx(W,'(.*)(oor)$','\1oâh');
  ReplRegEx(W,'(.*)(aar)$','\1aah');
  ReplRegEx(W,'(.*)([gbv])(er)$','\1\2âh');
  ReplRegEx(W,'(.*)([euai])(ter)$','\1\2tâh');
  ReplRegEx(W,'(.*)(omt)$','\1omp');
  ReplRegEx(W,'(.*)(cht)$','\1ch');
  ReplRegEx(W,'(.*)([gtkv])(ens)$','\2es');
  ReplRegEx(W,'(.*)(est)$','\1es');
  ReplRegEx(W,'(.*)(nkt)$','\1nk');
  ReplRegEx(W,'(.*)(ordt)$','\1ogdt');
  ReplRegEx(W,'(.*)(lig)$','\1lag');
  ReplRegEx(W,'(.*)(oude)$','\1âhwe');
  ReplRegEx(W,'(.*)(pen)$','\1pûh');
  ReplRegEx(W,'(.*)(tig)$','\1tag');
  ReplRegEx(W,'(.*)(igt)$','\1ig');
  ReplRegEx(W,'(.*)(ord)$','\1ogd');
  ReplRegEx(W,'(.*)(ors)$','\1ogs');
  ReplRegEx(W,'(.*)(urg)$','\1urrug');
  ReplRegEx(W,'(.*)(uurt)','\1uâht');
  ReplRegEx(W,'(.*)(l)([fgkmp])','\1\2\2u\3');
  ReplRegEx(W,'(.*)(r)([fgmnp])','\1\2\2u\3');
  ReplRegEx(W,'(.*)(r)(k)','\1\2\2e\3');
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

  ReplaceSubstr('oer','oeâh');
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

function CombineWords(aTokens:TTokens):TTokens;
var i,j:integer;
  t1,t2,tj:TToken;
  Comb:TCombination;
  Success:Boolean;
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
    begin
      if t1.TokenType = ttWord then
      begin
        for J := I+1 to high(aTokens) do
        begin
          tj := aTokens[J];
          if tj.TokenType = ttWord then
          begin
            t2 := tj;

            Success := False;
            for comb in Combinations do
              if CombineWords(Comb.SeparateWords[0], comb.SeparateWords[1], Comb.Combined) then
              begin
                Success := true;
                Break;
              end;

            if Success then
              Break;
          end;
        end;
      end;
    end;
    if t1.TokenType <> ttDeleted then
      Result := Result + [t1];
  end;
end;

function TranslateWords(const aTokens:TTokens):TTokens;
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


function TranslateToStructure(const ABN:string):TTokens;
begin
  Result := Tokenize(ABN);
  Result := CombineWords(Result);
  Result := TranslateWords(Result);
end;

function Translate(const ABN:string):string;overload;
var
  t    : TToken;
  Tokens:TTokens;
begin
  Tokens := TranslateToStructure(ABN);
  for t in Tokens do
    Result := Result + t.Value;
end;




end.
