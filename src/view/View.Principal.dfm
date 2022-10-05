object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 594
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object PageControlPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 815
    Height = 594
    ActivePage = Produtos
    Align = alClient
    TabOrder = 0
    OnChange = PageControlPrincipalChange
    object Clientes: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
      object lblUF: TLabel
        Left = 657
        Top = 18
        Width = 22
        Height = 21
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCidade: TLabel
        Left = 456
        Top = 18
        Width = 51
        Height = 21
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 172
        Top = 18
        Width = 46
        Height = 21
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCodCliente: TLabel
        Left = 20
        Top = 18
        Width = 53
        Height = 21
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtUfCliente: TEdit
        Left = 657
        Top = 45
        Width = 129
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtCidadeCliente: TEdit
        Left = 456
        Top = 45
        Width = 185
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnDelCliente: TButton
        Left = 657
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Remover'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnDelClienteClick
      end
      object btnEdtCliente: TButton
        Left = 512
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Editar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnEdtClienteClick
      end
      object dbgrdCliente: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 202
        Width = 766
        Height = 345
        BorderStyle = bsNone
        DataSource = DataModuleConexao.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        StyleName = 'Windows'
        OnDblClick = dbgrdClienteDblClick
      end
      object btnRecCliente: TButton
        Left = 165
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Recuperar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnRecClienteClick
      end
      object btnCadCliente: TButton
        Left = 20
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Cadastrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnCadClienteClick
      end
      object edtCliente: TEdit
        Left = 165
        Top = 45
        Width = 273
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object btnRecTodosCliente: TButton
        Left = 20
        Top = 147
        Width = 129
        Height = 33
        Caption = 'Retorna Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btnRecTodosClienteClick
      end
      object btnLimparCampos: TButton
        Left = 657
        Top = 147
        Width = 129
        Height = 33
        Caption = 'Limpar Campos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = btnLimparCamposClick
      end
      object edtCodCliente: TEdit
        Left = 20
        Top = 45
        Width = 129
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 10
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Operadores'
      ImageIndex = 3
      object lblNomeOperador: TLabel
        Left = 165
        Top = 18
        Width = 46
        Height = 21
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCodigoOperador: TLabel
        Left = 20
        Top = 18
        Width = 53
        Height = 21
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtOperador: TEdit
        Left = 165
        Top = 45
        Width = 621
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnCadOperador: TButton
        Left = 20
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Cadastrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCadOperadorClick
      end
      object btnRecOperador: TButton
        Left = 165
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Recuperar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnRecOperadorClick
      end
      object edtCodigoOperador: TEdit
        Left = 20
        Top = 45
        Width = 129
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object btnRecTodosOperadores: TButton
        Left = 20
        Top = 147
        Width = 129
        Height = 33
        Caption = 'Retorna Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnRecTodosOperadoresClick
      end
      object dbgrdOperador: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 198
        Width = 766
        Height = 353
        BorderStyle = bsNone
        DataSource = DataModuleConexao.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        StyleName = 'Windows'
        OnDblClick = dbgrdOperadorDblClick
      end
      object btnEdtOperador: TButton
        Left = 512
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Editar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnEdtOperadorClick
      end
      object btnDelOperador: TButton
        Left = 657
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Remover'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnDelOperadorClick
      end
    end
    object Produtos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 2
      object lblCodigoProduto: TLabel
        Left = 20
        Top = 18
        Width = 53
        Height = 21
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeProduto: TLabel
        Left = 165
        Top = 18
        Width = 70
        Height = 21
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblPrecoProduto: TLabel
        Left = 584
        Top = 18
        Width = 72
        Height = 21
        Caption = 'Valor (R$):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigoProduto: TEdit
        Left = 20
        Top = 45
        Width = 129
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object edtDescricaoProduto: TEdit
        Left = 165
        Top = 45
        Width = 404
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtValorProduto: TCurrencyEdit
        Left = 584
        Top = 45
        Width = 201
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbgrdProdutos: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 210
        Width = 774
        Height = 345
        BorderStyle = bsNone
        DataSource = DataModuleConexao.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        StyleName = 'Windows'
        OnDblClick = dbgrdProdutosDblClick
      end
      object btnCadProduto: TButton
        Left = 20
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Cadastrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnCadProdutoClick
      end
      object btnRecTodosProdutos: TButton
        Left = 20
        Top = 147
        Width = 129
        Height = 33
        Caption = 'Retorna Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnRecTodosProdutosClick
      end
      object btnEdtProduto: TButton
        Left = 440
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Editar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnEdtProdutoClick
      end
      object btnDelProduto: TButton
        Left = 656
        Top = 87
        Width = 129
        Height = 33
        Caption = 'Remover'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnDelProdutoClick
      end
    end
  end
end
