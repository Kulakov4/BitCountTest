unit SlowBitCount;

interface

function SlowCountBits(n: Byte): Byte;

implementation

function SlowCountBits(n: Byte): Byte;
var
  i, x: Byte;
begin
  Result := 0;
  for i := 0 to 7 do
  begin
    x := n and (1 shl i);
    if x = 0 then
      continue;
    Result := Result + 1;
  end;
end;

end.
