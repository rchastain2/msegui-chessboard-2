
{$ASSERTIONS ON}

uses
  SysUtils, Classes, StrUtils, IoUtils, PgnRead;

var
  LList: TList;
  LGameIdx, LTagIdx, LMoveIdx: integer;
  LGroupIdx: TGroupIndex;
  LGroups: PGroups;
  LFilename: string;
  
begin
  if ParamCount >= 1 then
    LFilename := ParamStr(1)
  else
    LFilename := './pgn/sample.pgn';
  Assert(FileExists(LFilename));
  
  LList := ParsePgnText(TFile.ReadAllText(LFilename));
  
  for LGameIdx := 0 to Pred(LList.Count) do
    with TChessGame(LList[LGameIdx]) do
    begin
      WriteLn('LGameIdx=', LGameIdx);
      WriteLn('White=', FTags.Values['White']);
      
      for LTagIdx := 0 to Pred(FTags.Count) do
        WriteLn(
          FTags.Names[LTagIdx], '=',
          FTags.ValueFromIndex[LTagIdx]
        );
      
      for LMoveIdx := 0 to Pred(FMoves.Count) do
      begin
        LGroups := FMoves[LMoveIdx];
        for LGroupIdx := Low(TGroupIndex) to High(TGroupIndex) do
          Write(LGroups^[LGroupIdx], ',');
        WriteLn;
      end;
      
      WriteLn(FTermination);
    end;
  
  for LGameIdx := Pred(LList.Count) downto 0 do
    TChessGame(LList[LGameIdx]).Free;
  LList.Free;
end.
