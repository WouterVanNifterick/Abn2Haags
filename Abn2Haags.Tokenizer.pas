unit Abn2Haags.Tokenizer;

interface

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

function Tokenize(const s: string): TTokens;


implementation

uses
  System.SysUtils,
  System.Character;


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


end.
