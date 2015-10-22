object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 184
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://localhost:3000/api'
    Params = <>
    HandleRedirects = True
    Left = 376
    Top = 192
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
      end>
    Resource = 'cidades'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 448
    Top = 128
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 352
    Top = 160
  end
end
