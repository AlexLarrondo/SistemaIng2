object Form7: TForm7
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form7'
  ClientHeight = 369
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 505
    Height = 369
    Color = cl3DDkShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 283
      Top = 114
      Width = 3
      Height = 15
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 31
      Top = 48
      Width = 185
      Height = 73
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Edit1: TEdit
        Left = 3
        Top = 28
        Width = 179
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object CheckBox1: TCheckBox
      Left = 289
      Top = 232
      Width = 250
      Height = 36
      Caption = 'Ser'#233' encargado de mantenimiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      WordWrap = True
    end
    object GroupBox3: TGroupBox
      Left = 31
      Top = 134
      Width = 185
      Height = 73
      Caption = 'Apellido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Edit2: TEdit
        Left = 3
        Top = 28
        Width = 187
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 28
      Top = 213
      Width = 188
      Height = 73
      Caption = 'DNI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Edit3: TEdit
        Left = 3
        Top = 28
        Width = 179
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 8
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 110
      Top = 308
      Width = 111
      Height = 50
      AutoSize = True
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BevelWidth = 3
      Caption = 'Panel1'
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 6
      object SpeedButton2: TSpeedButton
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 99
        Height = 38
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Modificar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 283
      Top = 308
      Width = 111
      Height = 50
      AutoSize = True
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BevelWidth = 3
      Caption = 'Panel1'
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 7
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 99
        Height = 38
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox6: TGroupBox
      Left = 283
      Top = 135
      Width = 185
      Height = 73
      Caption = 'Confirmar Contrase'#241'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Edit5: TEdit
        Left = 3
        Top = 28
        Width = 179
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 12
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 283
      Top = 48
      Width = 185
      Height = 73
      Caption = 'Contrase'#241'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Edit4: TEdit
        Left = 3
        Top = 28
        Width = 179
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 12
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
      end
    end
  end
end