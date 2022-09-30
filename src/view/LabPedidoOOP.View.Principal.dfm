object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 521
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 815
    Height = 521
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
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
        Left = 340
        Top = 16
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
      object btnCadastrar: TButton
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
        OnClick = btnCadastrarClick
      end
      object btnRecuperarOperadorCodigo: TButton
        Left = 340
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
        OnClick = btnRecuperarOperadorCodigoClick
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
        Left = 340
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
      object btnRecuperarTodosOperadores: TButton
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
        OnClick = btnRecuperarTodosOperadoresClick
      end
      object dbgrdOperador: TDBGrid
        AlignWithMargins = True
        Left = 20
        Top = 178
        Width = 766
        Height = 297
        BorderStyle = bsNone
        DataSource = DataModuleConexao.DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      object edtEditarOperador: TButton
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
        OnClick = edtEditarOperadorClick
      end
      object btnRemoverOperador: TButton
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
        OnClick = btnRemoverOperadorClick
      end
    end
  end
end
