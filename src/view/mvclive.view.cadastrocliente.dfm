object FormCliente: TFormCliente
  Left = 0
  Top = 0
  Caption = 'FormCliente'
  ClientHeight = 193
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 125
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 488
    object edtCodigo: TLabeledEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 29
      EditLabel.Width = 50
      EditLabel.Height = 21
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 0
      Text = ''
    end
    object edtNome: TLabeledEdit
      Left = 87
      Top = 32
      Width = 394
      Height = 29
      EditLabel.Width = 43
      EditLabel.Height = 21
      EditLabel.Caption = 'Nome'
      TabOrder = 1
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 8
      Top = 88
      Width = 353
      Height = 29
      EditLabel.Width = 48
      EditLabel.Height = 21
      EditLabel.Caption = 'Cidade'
      TabOrder = 2
      Text = ''
    end
    object edtEstado: TLabeledEdit
      Left = 367
      Top = 88
      Width = 114
      Height = 29
      EditLabel.Width = 46
      EditLabel.Height = 21
      EditLabel.Caption = 'Estado'
      TabOrder = 3
      Text = ''
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 125
    Width = 492
    Height = 68
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 1
    ExplicitWidth = 488
    ExplicitHeight = 67
    object Button1: TButton
      Left = 407
      Top = 10
      Width = 75
      Height = 48
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 403
      ExplicitHeight = 47
    end
    object Button2: TButton
      Left = 332
      Top = 10
      Width = 75
      Height = 48
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      ExplicitLeft = 328
      ExplicitHeight = 47
    end
  end
end
