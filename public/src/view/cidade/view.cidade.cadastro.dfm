object frmCadastroCidade: TfrmCadastroCidade
  Left = 0
  Top = 0
  Caption = 'Cadastrar cidade'
  ClientHeight = 132
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object lblnome: TLabel
    Left = 32
    Top = 32
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lblUF: TLabel
    Left = 267
    Top = 32
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object edtNome: TEdit
    Left = 32
    Top = 48
    Width = 229
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o nome'
  end
  object edtUFCidade: TEdit
    Left = 267
    Top = 48
    Width = 34
    Height = 21
    TabOrder = 1
    TextHint = 'UF'
  end
  object btnSalvar: TButton
    Left = 75
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 168
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
