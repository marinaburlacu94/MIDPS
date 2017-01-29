unit Calculator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure Do0per;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var accum:real;
oper:Integer;
f:integer;



procedure TForm1.Button1Click(Sender: TObject);
begin
if f=0
then begin
Edit1.Text:='0';
f:=1;
end
else
if Edit1.Text <> '0'
then Edit1.Text:=Edit1.Text+ '0';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
if f=0 then begin
 Edit1.Text:='1';
 f:=1;
 end
 else Edit1.Text:=Edit1.Text+'1';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   if (f=0)
   then begin
   Edit1.Text:='2';
   f:=1;end
   else Edit1.Text:=Edit1.Text+'2';


end;

procedure TForm1.Button9Click(Sender: TObject);
begin
if f=0 then begin
Edit1.text:='3';
f:=1;
end
else Edit1.text:=edit1.text+'3';

end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 if f=0 then begin
 Edit1.Text:='4';
 f:=1;
 end
 else Edit1.Text:=Edit1.Text+'4';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if (f=0) then begin
  Edit1.Text:='5';
  f:=1;
  end
  else Edit1.Text:=Edit1.Text+'5';
end;


procedure TForm1.Button12Click(Sender: TObject);
begin
 if f=0 then begin
 Edit1.Text:='6';
 f:=1;
end
else Edit1.Text:=Edit1.Text+'6';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
if f=0 then begin
Edit1.Text:='7';
f:=1;
end
else Edit1.Text:=Edit1.Text+'7';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
if f=0 then begin
Edit1.Text:='8';
f:=1;
end
else Edit1.Text:=Edit1.Text+'8';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
if f=0 then begin
Edit1.Text:='9';
f:=1;
end
else Edit1.Text:=Edit1.Text+'9';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if Edit1.Text= '0' then
begin
Edit1.Text:='0,';
f:=1;
end;
if Pos(',',Edit1.Text)=0 then
Edit1.Text:=Edit1.Text+ ',';
end;



procedure TForm1.Button6Click(Sender: TObject);
begin
  if f=0 then oper:=1
  else begin
  Do0per;
  oper:=1;
  f:=0;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if f=0 then oper:=2
else begin
Do0per;
oper:=2;
f:=0;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if f=0 then
oper:=0
else begin
Do0per;
oper:=0;
f:=0;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Edit1.Text:='0';
accum:=0;
oper:=0;
f:=0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var Key:char;
begin
Key:=Chr(0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  oper:=0;
end;




procedure TForm1.Do0per;
var numb:real;
begin
 numb:=StrToFloat(Form1.Edit1.Text);
case oper of
0: accum:=numb;
1: accum:=accum+numb;
2: accum:=accum-numb;
end;
Form1.Edit1.Text:=FloatToStr(accum);
end;

end.
