unit FastestBitCount;

interface

function FastestCountBits(n: Byte): Byte;

implementation

var
  CountBitArray: array [Byte] of Byte;

function FastestCountBits(n: Byte): Byte;
begin
  Result := CountBitArray[n];
end;

procedure InitCountBitArray;

  function CountBits(n: Byte): Byte;
  const
    Arr: array [0 .. 15] of Byte = (0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3,
      2, 3, 3, 4);
  begin
    Result := Arr[n shr 4] + Arr[n and $0F];
  end;

var
  i: Byte;
begin
  for i := 0 to 255 do
    CountBitArray[i] := CountBits(i);
end;

initialization

InitCountBitArray;

end.
