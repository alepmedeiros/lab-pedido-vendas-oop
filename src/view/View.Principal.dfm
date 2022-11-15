object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lab. Venda OOP.'
  ClientHeight = 594
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PageControlPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 815
    Height = 594
    ActivePage = Pedidos
    Align = alClient
    TabOrder = 0
    OnChange = PageControlPrincipalChange
    OnChanging = PageControlPrincipalChanging
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
      object lblNome: TLabel
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
        TabOrder = 3
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
        TabOrder = 2
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
        TabOrder = 7
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
        TabOrder = 6
        OnClick = btnEdtClienteClick
      end
      object dbgrdCliente: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 194
        Width = 766
        Height = 360
        BorderStyle = bsNone
        DataSource = DataModuleUnit.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 10
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
        TabOrder = 4
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
        TabOrder = 1
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
        TabOrder = 0
      end
    end
    object Operadores: TTabSheet
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
        TabOrder = 1
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
        TabOrder = 2
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
        TabOrder = 0
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
        Top = 193
        Width = 766
        Height = 360
        BorderStyle = bsNone
        DataSource = DataModuleUnit.DataSource
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
      object dbgrdProdutos: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 193
        Width = 765
        Height = 359
        BorderStyle = bsNone
        DataSource = DataModuleUnit.DataSource
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
        TabOrder = 3
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
        TabOrder = 6
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
        TabOrder = 4
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
        TabOrder = 5
        OnClick = btnDelProdutoClick
      end
      object edtValorProduto: TEdit
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
    end
    object Pedidos: TTabSheet
      Caption = 'Novo Pedido'
      ImageIndex = 3
      object lblCodProdPesq: TLabel
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
      object lblDescProdPesq: TLabel
        Left = 264
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
      object lblPrecoProdPesq: TLabel
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
      object lblCarrinho: TLabel
        Left = 20
        Top = 138
        Width = 64
        Height = 21
        Caption = 'Carrinho:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblClientePedido: TLabel
        Left = 364
        Top = 90
        Width = 51
        Height = 21
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblTotalPedido: TLabel
        Left = 468
        Top = 138
        Width = 108
        Height = 21
        Caption = 'Total do Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblQuantidade: TLabel
        Left = 142
        Top = 18
        Width = 84
        Height = 21
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodProdutoPesq: TEdit
        Left = 20
        Top = 45
        Width = 101
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodProdutoPesqExit
        OnKeyDown = edtCodProdutoPesqKeyDown
      end
      object edtDescProdutoPesq: TEdit
        Left = 264
        Top = 45
        Width = 305
        Height = 29
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object btnRecuProdPesq: TButton
        Left = 20
        Top = 87
        Width = 101
        Height = 33
        Caption = 'Recuperar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnRecuProdPesqClick
      end
      object btnAddProdPesq: TButton
        Left = 142
        Top = 87
        Width = 101
        Height = 33
        Caption = 'Add. Prod.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnAddProdPesqClick
      end
      object dbgrdPedido: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 192
        Width = 765
        Height = 314
        BorderStyle = bsNone
        DataSource = DataModuleUnit.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        StyleName = 'Windows'
        OnCellClick = dbgrdPedidoCellClick
        OnDblClick = dbgrdPedidoDblClick
      end
      object btnConfirmarPedido: TButton
        Left = 656
        Top = 520
        Width = 129
        Height = 33
        Caption = 'Con&firmar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = btnConfirmarPedidoClick
      end
      object btnCancelarPedido: TButton
        Left = 20
        Top = 520
        Width = 129
        Height = 33
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnCancelarPedidoClick
      end
      object btnIniciarPedido: TButton
        Left = 248
        Top = 520
        Width = 313
        Height = 33
        Caption = '&Novo Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btnIniciarPedidoClick
      end
      object edtClientePedido: TEdit
        Left = 496
        Top = 87
        Width = 289
        Height = 29
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object edtCodClientePedido: TEdit
        Left = 423
        Top = 87
        Width = 65
        Height = 29
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 12
      end
      object edtQuantidade: TEdit
        Left = 142
        Top = 45
        Width = 101
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
        OnEnter = edtQuantidadeEnter
        OnKeyDown = edtQuantidadeKeyDown
      end
      object btnRemoverEntrada: TButton
        Left = 142
        Top = 131
        Width = 101
        Height = 33
        Caption = 'Remover Ent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnRemoverEntradaClick
      end
      object btnAttEntrada: TButton
        Left = 264
        Top = 131
        Width = 101
        Height = 33
        Caption = 'Atualizar Ent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnAttEntradaClick
      end
      object edtValorProdutoPesq: TEdit
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
        TabOrder = 13
      end
      object edtTotalPedido: TEdit
        Left = 584
        Top = 134
        Width = 201
        Height = 29
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
    end
    object GerenciarPedidos: TTabSheet
      Caption = 'Gerenciar Pedidos'
      ImageIndex = 4
      object lblPedidosConcluidos: TLabel
        Left = 20
        Top = 18
        Width = 57
        Height = 21
        Caption = 'Pedidos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblItensPedidos: TLabel
        Left = 20
        Top = 237
        Width = 109
        Height = 21
        Caption = 'Itens do Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object dbgrdPedidosConcluidos: TDBGrid
        Left = 20
        Top = 45
        Width = 765
        Height = 180
        DataSource = DataModuleUnit.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = dbgrdPedidosConcluidosCellClick
        OnKeyDown = dbgrdPedidosConcluidosKeyDown
        OnKeyUp = dbgrdPedidosConcluidosKeyUp
        OnMouseWheel = dbgrdPedidosConcluidosMouseWheel
      end
      object dbgrdPedidoItemConcluidos: TDBGrid
        Left = 20
        Top = 267
        Width = 765
        Height = 233
        DataSource = DataModuleUnit.DataSourceAux
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object btnExcluirPedido: TButton
        Left = 20
        Top = 515
        Width = 141
        Height = 33
        Caption = 'Excluir Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnExcluirPedidoClick
      end
    end
  end
end
