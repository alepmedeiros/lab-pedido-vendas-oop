object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de produto'
  ClientHeight = 172
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblnome: TLabel
    Left = 32
    Top = 32
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object Label1: TLabel
    Left = 32
    Top = 73
    Width = 26
    Height = 15
    Caption = 'Valor'
  end
  object edtDescricao: TEdit
    Left = 32
    Top = 48
    Width = 269
    Height = 21
    TabOrder = 0
    TextHint = 'Digite o nome'
  end
  object btnSalvar: TButton
    Left = 75
    Top = 130
    Width = 75
    Height = 25
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 168
    Top = 130
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 32
    Top = 88
    Width = 97
    Height = 23
    TabOrder = 3
    TextHint = '0,00'
    OnExit = edtValorExit
  end
end
