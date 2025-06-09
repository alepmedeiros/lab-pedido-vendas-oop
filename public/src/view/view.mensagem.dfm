object frmMensagem: TfrmMensagem
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Excluir?'
  ClientHeight = 140
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 32
    Width = 191
    Height = 20
    Caption = 'Confimar a exluc'#227'o do item?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Sim'
    ModalResult = 6
    TabOrder = 0
  end
  object Button2: TButton
    Left = 172
    Top = 72
    Width = 75
    Height = 25
    Caption = 'N'#227'o'
    ModalResult = 7
    TabOrder = 1
  end
end
