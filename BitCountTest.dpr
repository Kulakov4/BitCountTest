program BitCountTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Winapi.Windows,
  BitCount in 'BitCount.pas',
  FastestBitCount in 'FastestBitCount.pas',
  SlowBitCount in 'SlowBitCount.pas';

type
  TGetBitCountRef = reference to function(n: Byte): Byte;

procedure Test(const ADescription: String; var ATestArray: Array of byte; AGetBitCountRef: TGetBitCountRef );
Var
  I: Integer;
  ATimeInterval, InitialF, FinalF: Int64;
begin
  QueryPerformanceCounter(InitialF);
  for I := Low(ATestArray) to High(ATestArray) do
  begin
    AGetBitCountRef(ATestArray[i]);
  end;
  QueryPerformanceCounter(FinalF);
  ATimeInterval := FinalF - InitialF;
  Writeln(ADescription);
  Writeln(Format('Время = %d у.е.', [ATimeInterval]));
  Writeln;
end;

procedure InitTestArray(var ATestArray: Array of byte);
var
  I: Integer;
begin
  // Заполняем тестовый массив случайными значениями
  Randomize;
  for i := Low(ATestArray) to High(ATestArray) do
  begin
    ATestArray[i] := Byte(Random(256));
  end;
end;

var
  lpFrequency:Int64;
  TestArray: Array[0..1000000] of byte;
begin
  if not QueryPerformanceFrequency(lpFrequency) then
  begin
    Writeln('hi-res timer is not supported');
    exit;
  end;

  InitTestArray(TestArray);

  Test('Оптимальный по памяти вариант', TestArray, SlowCountBits);

  Test('Оптимальный по скорости вариант', TestArray, FastestCountBits);

  Test('Оптимальный по скорости и памяти вариант', TestArray, CountBits);

  Readln;
end.
