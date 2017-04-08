object frmLogin: TfrmLogin
  Left = 417
  Top = 213
  Width = 220
  Height = 190
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 38
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 21
    Top = 78
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object edtUsuario: TEdit
    Left = 69
    Top = 33
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'manuel'
  end
  object btnConfirmar: TButton
    Left = 23
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object edtSenha: TEdit
    Left = 69
    Top = 73
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'real1270'
  end
  object btnCancelar: TButton
    Left = 116
    Top = 103
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.ID, P.PERFIL FROM PERMISSAO P'
      'INNER JOIN USUARIO U ON P.ID = U.ID_PERFIL'
      'AND U.LOGIN =:LOGIN AND U.SENHA =:SENHA')
    SQLConnection = dmPrincipal.sqlConnPrincipal
    Left = 120
    Top = 137
    object qryLoginPERFIL: TStringField
      FieldName = 'PERFIL'
      Required = True
    end
    object qryLoginID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
end
