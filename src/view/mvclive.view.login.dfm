object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = 'FormLogin'
  ClientHeight = 361
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 361
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 442
    ExplicitHeight = 360
    object Panel2: TPanel
      Left = 107
      Top = 72
      Width = 240
      Height = 185
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 64
        Width = 234
        Height = 21
        Margins.Top = 20
        Align = alTop
        Alignment = taCenter
        Caption = 'Senha'
        ExplicitWidth = 43
      end
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 240
        Height = 21
        Align = alTop
        Alignment = taCenter
        Caption = 'Usu'#225'rio'
        ExplicitWidth = 54
      end
      object Edit1: TEdit
        Left = 0
        Top = 21
        Width = 240
        Height = 23
        Align = alTop
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 0
        Top = 88
        Width = 240
        Height = 23
        Align = alTop
        BorderStyle = bsNone
        PasswordChar = '*'
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 0
        Top = 128
        Width = 240
        Height = 57
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Button1: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 108
          Height = 51
          Align = alClient
          Caption = 'Logar'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 117
          Top = 3
          Width = 120
          Height = 51
          Align = alRight
          Caption = 'Cadastrar'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
  end
end
