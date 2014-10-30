unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    Shape2: TShape;
    Edit1: TEdit;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  temp:string;
  x,y:integer;

implementation

{$R *.dfm}

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
temp:=socket.ReceiveText;
if copy(temp,1,5)='kalah' then
showmessage('Selamat Client Anda Menang')
else if copy(temp,1,3)='now' then
begin
label2.Caption:='From = '+copy(label1.Caption,7,length(label1.Caption)-6);
label1.Caption:='Now = '+copy(temp,4,length(temp)-3);
end
else
begin
shape2.Top:=strtoint(copy(temp,1,pos('!',temp)-1));
shape2.Left:=strtoint(copy(temp,pos('!',temp)+1,pos('@',temp)-pos('!',temp)-1));
if shape2.left<=0 then
shape2.Left:=form1.Width;
x:=strtoint(copy(temp,pos('@',temp)+1,pos('#',temp)-pos('@',temp)-1));
y:=strtoint(copy(temp,pos('#',temp)+1,length(temp)-pos('#',temp)));
shape2.Visible:=true;
timer1.Enabled:=true;
clientsocket1.Socket.SendText('now2');
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if shape2.left<=0 then
begin
x:=10;
end
else if (shape2.left+33>form1.width) and (x=10) then
begin
timer1.Enabled:=false;
clientsocket1.Socket.SendText('to2'+inttostr(shape2.top)+'!0'+'@'+inttostr(x)+'#'+inttostr(y));
shape2.Hide;
end;
if shape2.top+33>=form1.Height then
y:=-10
else if (shape2.top<=0) and (y=-10)  then
begin
timer1.Enabled:=false;
clientsocket1.Socket.SendText('to0'+inttostr(shape2.top)+'!'+inttostr(shape2.left)+'@'+inttostr(x)+'#'+inttostr(y));
shape2.Hide;
end;
shape2.left:=shape2.Left+x;
shape2.top:=shape2.top+y;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 clientsocket1.Port:=2000;
clientsocket1.Address:=edit1.Text;
edit1.Enabled:=false;
clientsocket1.Open;
timer1.Enabled:=false;
shape2.Hide;
timer1.Interval:=50;
label1.Caption:='Now = Server';
label2.Caption:='From = ';
end;

end.
