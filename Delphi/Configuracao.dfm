object frmConfiguracao: TfrmConfiguracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configuracao'
  ClientHeight = 117
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 51
    Top = 48
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object edtEndereco: TEdit
    Left = 83
    Top = 21
    Width = 214
    Height = 21
    TabOrder = 0
  end
  object edtPorta: TEdit
    Left = 83
    Top = 48
    Width = 54
    Height = 21
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 83
    Top = 86
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 164
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
