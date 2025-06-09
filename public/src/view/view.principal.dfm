object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 205
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object btnCLiente: TButton
    Left = 104
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Cliente'
    TabOrder = 0
    OnClick = btnCLienteClick
  end
  object btnProduto: TButton
    Left = 104
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Produto'
    TabOrder = 1
    OnClick = btnProdutoClick
  end
  object btnPedido: TButton
    Left = 104
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Pedido'
    TabOrder = 2
    OnClick = btnPedidoClick
  end
  object Button1: TButton
    Left = 0
    Top = 180
    Width = 105
    Height = 25
    Caption = 'testar conexao'
    TabOrder = 3
    OnClick = Button1Click
  end
end
