object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 343
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 545
    Height = 345
    Color = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 31
      Top = 28
      Width = 185
      Height = 105
      Caption = 'Nombre'
      TabOrder = 0
      object Edit1: TEdit
        Left = 40
        Top = 44
        Width = 121
        Height = 30
        TabOrder = 0
      end
    end
    object Button1: TButton
      Left = 120
      Top = 268
      Width = 96
      Height = 49
      Caption = 'Registrar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 280
      Top = 268
      Width = 97
      Height = 49
      Caption = 'Salir'
      TabOrder = 2
      OnClick = Button2Click
    end
    object CheckBox1: TCheckBox
      Left = 264
      Top = 182
      Width = 257
      Height = 30
      Caption = 'Ser'#233' encargado de mantenimiento'
      TabOrder = 3
    end
    object GroupBox3: TGroupBox
      Left = 280
      Top = 28
      Width = 185
      Height = 105
      Caption = 'Apellido'
      TabOrder = 4
      object Edit2: TEdit
        Left = 24
        Top = 75
        Width = 121
        Height = 30
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 31
      Top = 139
      Width = 185
      Height = 105
      Caption = 'DNI'
      TabOrder = 5
      object Edit3: TEdit
        Left = 32
        Top = 43
        Width = 121
        Height = 30
        MaxLength = 8
        NumbersOnly = True
        TabOrder = 0
      end
    end
  end
end
