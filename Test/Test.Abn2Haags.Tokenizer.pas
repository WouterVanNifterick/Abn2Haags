unit Test.Abn2Haags.Tokenizer;

interface

uses
  Abn2Haags.Tokenizer,
  DUnitX.TestFramework;

type

  [TestFixture]
  TokenizerTests = class(TObject)
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

procedure TokenizerTests.Setup;
begin
end;

procedure TokenizerTests.TearDown;
begin
end;

procedure TokenizerTests.Test1;
begin
end;

procedure TokenizerTests.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TokenizerTests);
end.
