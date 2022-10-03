unit DBGrid.Functions;

interface

uses Grids, DBGrids;

procedure AutoSizeDBGrid(const xDBGrid: TDBGrid);

implementation

procedure AutoSizeDBGrid(const xDBGrid: TDBGrid);
var
  I, TotalWidht, VarWidth, QtdTotalColuna : Integer;
  xColumn : TColumn;
begin
  // Largura total de todas as colunas antes de redimensionar
  TotalWidht := 0;
  // Como dividir todo o espaço extra na grade
  VarWidth := 0;
  // Quantas colunas devem ser auto-redimensionamento
  QtdTotalColuna := 0;

  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    TotalWidht := TotalWidht + xDBGrid.Columns[I].Width;
    if xDBGrid.Columns[I].Field.Tag <> 0 then
      Inc(QtdTotalColuna);
  end;

  // Adiciona 1px para a linha de separador de coluna
  if dgColLines in xDBGrid.Options then
    TotalWidht := TotalWidht + xDBGrid.Columns.Count;

  // Adiciona a largura da coluna indicadora
  if dgIndicator in xDBGrid.Options then
    TotalWidht := TotalWidht + IndicatorWidth;

  // width vale "Left"
  VarWidth :=  xDBGrid.ClientWidth - TotalWidht;


  // Da mesma forma distribuir VarWidth para todas as colunas auto-resizable
  if QtdTotalColuna > 0 then
    VarWidth := varWidth div QtdTotalColuna;

  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    xColumn := xDBGrid.Columns[I];
    if xColumn.Field.Tag <> 0 then
    begin
      xColumn.Width := xColumn.Width + VarWidth;
      if xColumn.Width < xColumn.Field.Tag then
        xColumn.Width := xColumn.Field.Tag;
    end;
  end;
end;

end.
