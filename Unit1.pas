unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn2: TButton;
    edt3: TEdit;
    lbl4: TLabel;
    dlgSave1: TSaveDialog;
    edt4: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edt5: TEdit;
    lbl7: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    lbl8: TLabel;
    procedure lbl3MouseEnter(Sender: TObject);
    procedure lbl3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lbl3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn2Click(Sender: TObject);
    procedure edt4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateRdp(Path: string; User: string; Pwd: string; IP: string);
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}
uses
  RdpCrypt;

procedure TForm1.btn2Click(Sender: TObject);
var
  StrUser, StrPwd, StrIP: string;
  Temp: string;
  Pwd: string;
  I: Integer;
  NoBlank: Boolean;
begin
  NoBlank := True;
  StrPwd := Trim(edt1.Text);
  StrUser := Trim(edt4.Text);
  StrIP := Trim(edt3.Text);

  if StrUser = '' then
    Exit;
  if StrPwd = '' then
    Exit;
  if StrIP = '' then
    Exit;
  if (not rb1.Checked) and (not rb2.Checked) then
    Exit;

  for I := 0 to Length(StrUser) do
  begin
    if StrUser[I] = ' ' then
    begin
      NoBlank := False;
      Break;
    end;
  end;
  for I := 0 to Length(StrPwd) do
  begin
    if StrPwd[I] = ' ' then
    begin
      NoBlank := False;
      Break;
    end;
  end;
  for I := 0 to Length(StrIP) do
  begin
    if StrIP[I] = ' ' then
    begin
      NoBlank := False;
      Break;
    end;
  end;

  if not NoBlank then
  begin
    edt2.Text := '您的密码中含有空格...';
    Exit;

  end
  else
  begin
    Pwd := CryptRDPPassword(StrPwd);
    try
      if dlgSave1.Execute() then
      begin
        CreateRdp(dlgSave1.FileName, StrUser, Pwd, StrIP);
      end;
    except
      ShowMessage('错误...');

    end;
  end;

end;

procedure TForm1.CreateRdp(Path: string; User: string; Pwd: string; IP: string);
var
  RdpStr: TStringList;
begin
  RdpStr := TStringList.Create;
  if rb2.Checked then
  begin
    RdpStr.Add('screen mode id:i:2');
    RdpStr.Add('use multimon:i:0');
    RdpStr.Add('desktopwidth:i:1600');
    RdpStr.Add('desktopheight:i:900');
    RdpStr.Add('session bpp:i:32');
    RdpStr.Add('winposstr:s:0,1,609,51,1600,651');
    RdpStr.Add('compression:i:1');
    RdpStr.Add('keyboardhook:i:2');
    RdpStr.Add('audiocapturemode:i:0');
    RdpStr.Add('videoplaybackmode:i:1');
    RdpStr.Add('connection type:i:7');
  end;
  RdpStr.Add('networkautodetect:i:1' + #10 + 'bandwidthautodetect:i:1' + #10 + 'displayconnectionbar:i:1' + #10 + 'enableworkspacereconnect:i:0' + #10 + 'disable wallpaper:i:0' + #10 + 'allow font smoothing:i:0' + #10 + 'allow desktop composition:i:0' + #10 + 'disable full window drag:i:1' + #10 + 'disable menu anims:i:1' + #10 + 'disable themes:i:0' + #10 + 'disable cursor setting:i:0' + #10 + 'bitmapcachepersistenable:i:1');
  RdpStr.Add('full address:s:' + IP);
  RdpStr.Add('audiomode:i:0' + #10 + 'redirectprinters:i:1' + #10 + 'redirectcomports:i:0' + #10 + 'redirectsmartcards:i:1' + #10 + 'redirectclipboard:i:1' + #10 + 'redirectposdevices:i:0' + #10 + 'autoreconnection enabled:i:1' + #10 + 'authentication level:i:2' + #10 + 'prompt for credentials:i:0' + #10 + 'negotiate security layer:i:1' + #10 + 'remoteapplicationmode:i:0' + #10 + 'alternate shell:s:' + #10 + 'shell working directory:s:' + #10 + 'gatewayhostname:s:' + #10 + 'gatewayusagemethod:i:4' + #10 +
    'gatewaycredentialssource:i:4' + #10 + 'gatewayprofileusagemethod:i:0' + #10 + 'promptcredentialonce:i:0' + #10 + 'gatewaybrokeringtype:i:0' + #10 + 'use redirection server name:i:0' + #10 + 'rdgiskdcproxy:i:0' + #10 + 'kdcproxyname:s:' + #10 + 'drivestoredirect:s:D:\;');
  if rb1.Checked then
  begin
    RdpStr.Add('username:s:' + Trim(edt5.Text) + '\' + User);
  end;
  if rb2.Checked then
  begin
    RdpStr.Add('username:s:' + User);
  end;
  RdpStr.Add('password 51:b:' + Pwd);
  RdpStr.TrailingLineBreak := False;
  RdpStr.SaveToFile(Path + '.rdp');
  RdpStr.Free;
  lbl8.Caption:='本次导出成功！';
end;

procedure TForm1.edt4Change(Sender: TObject);
begin
  lbl8.Caption := '';
end;

procedure TForm1.lbl3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edt1.PasswordChar := #0;
  edt4.PasswordChar := #0;
end;

procedure TForm1.lbl3MouseEnter(Sender: TObject);
begin
  //edt1.PasswordChar:=#0;
end;

procedure TForm1.lbl3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edt1.PasswordChar := '*';
  edt4.PasswordChar := '*';
end;

end.

