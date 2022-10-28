object FormProduct: TFormProduct
  Left = 0
  Top = 0
  Caption = 'CRUD-Produto'
  ClientHeight = 417
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBG: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 417
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 545
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
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 164
      Top = 58
      Width = 80
      Height = 39
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object btnRecuperar: TButton
      Left = 246
      Top = 58
      Width = 80
      Height = 39
      Caption = 'Recuperar'
      TabOrder = 6
      OnClick = btnRecuperarClick
    end
    object dbgrdProdutos: TDBGrid
      Left = 0
      Top = 103
      Width = 537
      Height = 314
      DataSource = DataModuleConnection.FDataSource
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgrdProdutosDblClick
    end
    object btnEncontrarTodos: TButton
      Left = 332
      Top = 58
      Width = 69
      Height = 39
      Caption = 'Todos'
      TabOrder = 8
      OnClick = btnEncontrarTodosClick
    end
  end
end
