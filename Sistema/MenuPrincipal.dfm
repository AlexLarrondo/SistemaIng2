object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 291
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 526
    Height = 285
    Align = alClient
    AutoSize = True
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 119
      Width = 454
      Height = 39
      Caption = 'Fog'#243'n del Club Atl'#233'tico Huracan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic, fsUnderline]
      ParentFont = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 8
    object Men1: TMenuItem
      Caption = 'Men'#250
    end
    object Pedidos1: TMenuItem
      Caption = 'Produtos'
      object ListarProductos1: TMenuItem
        Caption = 'Listar Productos'
      end
    end
    object Pedidos2: TMenuItem
      Caption = 'Pedidos'
      object GenerarPedido1: TMenuItem
        Caption = 'Generar Pedido'
      end
      object Anulartickets1: TMenuItem
        Caption = 'Anular tickets'
      end
    end
    object Salir1: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
end
