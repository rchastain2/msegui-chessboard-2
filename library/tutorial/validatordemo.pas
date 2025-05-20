
uses
  SysUtils, Fen, Validator;

var
  v: TValidator;
  i: integer;
  
begin
  v := TValidator.Create;
  for i := Low(CFenExamples) to High(CFenExamples) do
    WriteLn(v.IsFen(CFenExamples[i]));
  v.Free;
end.
