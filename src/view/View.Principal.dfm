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
    ActivePage = Cliente
    Align = alClient
    TabOrder = 0
    OnChange = PageControlPrincipalChange
    ExplicitHeight = 521
    object Cliente: TTabSheet
      Caption = 'Cliente'
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
        Left = 319
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
        Left = 20
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
        Top = 127
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
        Left = 319
        Top = 45
        Width = 306
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
      end
      object btnEdtCliente: TButton
        Left = 496
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
      end
      object btnRecCliente: TButton
        Left = 193
        Top = 155
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
        Left = 20
        Top = 45
        Width = 270
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
        Left = 657
        Top = 155
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
      object edtCodCliente: TEdit
        Left = 20
        Top = 155
        Width = 154
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #39
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 9
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Operadores'
      ImageIndex = 3
      object lblNomeOperador: TLabel
        Left = 20
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
        Left = 312
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
      object lblNomeOperadorRetornado: TLabel
        Left = 488
        Top = 18
        Width = 133
        Height = 21
        Caption = 'Nome Recuperado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtOperador: TEdit
        Left = 20
        Top = 45
        Width = 270
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
        Left = 312
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
      object edtNomeOperadorRetornado: TEdit
        Left = 488
        Top = 45
        Width = 298
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtCodigoOperador: TEdit
        Left = 312
        Top = 45
        Width = 157
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
        Top = 135
        Width = 129
        Height = 33
        Caption = 'Retorna Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnRecTodosOperadoresClick
      end
      object dbgrdOperador: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 178
        Width = 766
        Height = 373
        BorderStyle = bsNone
        DataSource = DataModuleConexao.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        StyleName = 'Windows'
      end
      object btnEdtOperador: TButton
        Left = 488
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
        TabOrder = 5
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
        TabOrder = 6
        OnClick = btnDelOperadorClick
      end
    end
  end
end
