object FrmEditarItem: TFrmEditarItem
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Editar item'
  ClientHeight = 123
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 368
    Height = 123
    Align = alClient
    Caption = 'Produto'
    TabOrder = 0
    ExplicitWidth = 364
    ExplicitHeight = 122
    object Label2: TLabel
      Left = 24
      Top = 41
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label3: TLabel
      Left = 131
      Top = 41
      Width = 70
      Height = 15
      Caption = 'Valor unit'#225'rio'
    end
    object edtDescricaoProduto: TEdit
      Left = 24
      Top = 17
      Width = 305
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object edtValorUnitario: TEdit
      Left = 131
      Top = 56
      Width = 86
      Height = 23
      TabOrder = 1
      TextHint = '0,00'
      OnExit = edtValorUnitarioExit
    end
    object edtQuantidade: TEdit
      Left = 24
      Top = 56
      Width = 86
      Height = 23
      TabOrder = 2
      TextHint = '0'
      OnExit = edtQuantidadeExit
    end
    object btnIncluirItem: TButton
      Left = 72
      Top = 88
      Width = 89
      Height = 24
      Caption = 'Salvar'
      ModalResult = 1
      TabOrder = 3
      WordWrap = True
    end
    object btnExcluir: TButton
      Left = 199
      Top = 88
      Width = 89
      Height = 24
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 4
      WordWrap = True
    end
  end
end
