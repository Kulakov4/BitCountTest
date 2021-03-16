unit BitCount;

interface

function CountBits(n: Byte): Byte;

implementation

function CountBits(n: Byte): Byte;
const
  arr: array [0 .. 15] of Byte = (0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3,
    2, 3, 3, 4);
begin
  Result := arr[n shr 4] + arr[n and $0F];
end;

end.
