object FormProduct: TFormProduct
  Left = 0
  Top = 0
  Caption = 'CRUD-Produto'
  ClientHeight = 145
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBG: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 145
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 539
    ExplicitHeight = 433
    object lblCodigo: TLabel
      Left = 2
      Top = 0
      Width = 44
      Height = 17
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 79
      Top = 0
      Width = 59
      Height = 17
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorProduto: TLabel
      Left = 386
      Top = 0
      Width = 93
      Height = 17
      Caption = 'Valor de Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 2
      Top = 18
      Width = 64
      Height = 23
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 72
      Top = 18
      Width = 304
      Height = 23
      TabOrder = 1
    end
    object edtPrecoVenda: TCurrencyEdit
      Left = 383
      Top = 18
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object btnAdicionar: TButton
      Left = 0
      Top = 58
      Width = 80
      Height = 39
      Caption = 'Adicionar'
      TabOrder = 3
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 83
      Top = 58
      Width = 80
      Height = 39
      Caption = 'Editar'
      TabOrder = 4
    end
    object btnExcluir: TButton
      Left = 164
      Top = 58
      Width = 80
      Height = 39
      Caption = 'Excluir'
      TabOrder = 5
    end
  end
end
