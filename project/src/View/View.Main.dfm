object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object btnProducts: TButton
    Left = 0
    Top = 0
    Width = 260
    Height = 260
    Caption = 'Produtos'
    TabOrder = 0
    OnClick = btnProductsClick
  end
  object btnCustomers: TButton
    Left = 258
    Top = 0
    Width = 260
    Height = 260
    Caption = 'Clientes'
    TabOrder = 1
    OnClick = btnCustomersClick
  end
  object btnPurchaseOrder: TButton
    Left = 0
    Top = 256
    Width = 518
    Height = 132
    Caption = 'Pedidos'
    TabOrder = 2
  end
end
