unit MainUnit_v2;

interface

uses Forms,StdCtrls,ExtCtrls,Classes,Controls,Buttons,SysUtils,Dialogs;

type
  TMainForm2 = class(TForm)
    Button7: TSpeedButton;
    Button8: TSpeedButton;
    Button9: TSpeedButton;
    Button4: TSpeedButton;
    Button5: TSpeedButton;
    Button6: TSpeedButton;
    Button1: TSpeedButton;
    Button2: TSpeedButton;
    Button3: TSpeedButton;
    Button0: TSpeedButton;
    PlusMinus: TSpeedButton;
    Equal: TSpeedButton;
    Divide: TSpeedButton;
    Multiply: TSpeedButton;
    Minus: TSpeedButton;
    Plus: TSpeedButton;
    Output: TLabel;
    Clear: TSpeedButton;
    ClearEntry: TSpeedButton;
    Back: TSpeedButton;
    Dot: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure DigitClick(Sender: TObject);
    procedure DotClick(Sender: TObject);
    procedure ClearEntryClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OperationClick(Sender: TObject);
    procedure EqualClick(Sender: TObject);
    procedure PlusMinusClick(Sender: TObject);
  private
    procedure UpdateOutput;
    procedure UpdateAccumulator;
    procedure SetMemory(Value: Currency);
  end;

var MainForm2: TMainForm2;

implementation
{$R *.dfm}

const
  maxDigits=25; // ������������ ���������� ���� � �����
  Esc=#27; Enter=#13;

var
  Accumulator: Currency; // ������� ���������
  Memory: Currency; //������� ���������
  Operator: Char;
  Flag: Boolean = False; // ���� ���� ���������� ����������, ��� ������ ������ ���� ����� (�� ��������� - ����������)
  X: String[maxDigits]; // ���������

procedure TMainForm2.UpdateOutput;
begin X:=FloatToStr(Accumulator); Output.Caption:=X+' '; end;

{ ���������� �������� Accumulator ������� ������� ����� }
procedure TMainForm2.UpdateAccumulator;
begin try Accumulator:=StrToFloat(X) except ShowMessage('������ �����!') end; end;

{ ������������ Value � MemAcc � ��������� Memory }
procedure TMainForm2.SetMemory(Value: Currency);
begin Memory:=Value end;

procedure TMainForm2.FormCreate(Sender: TObject);
begin Accumulator:=0; Memory:=0; UpdateOutput; end;

{ ��������� ������� �� ������� � ������ (0-9) }
procedure TMainForm2.DigitClick(Sender: TObject);
begin
  if Length(X)=maxDigits then Exit;
  if Flag then X:='';
  X:=X+(Sender as TSpeedButton).Caption;
  UpdateAccumulator; UpdateOutput;
  Flag:=False;
end;

{ ��������� ������� �� ������ � ������ }
procedure TMainForm2.DotClick(Sender: TObject);
begin
  if Length(X)+1=maxDigits then Exit;
  if Flag or (X='') then X:='0';
  X:=X+','; Output.Caption:=X+' ';
  Flag:=False;
end;

{ �������� ������� ���� (������ Accumulator) }
procedure TMainForm2.ClearEntryClick(Sender: TObject);
begin Accumulator:=0; UpdateOutput end;

{ �������� ������� ���� � ������ (Accumulator � MemAcc) }
procedure TMainForm2.ClearClick(Sender: TObject);
begin Accumulator:=0; Flag:=True; UpdateOutput; SetMemory(0) end;

{ ������� ��������� �������� ������ }
procedure TMainForm2.BackClick(Sender: TObject);
begin
  if Length(X)=1 then X:='0' else Delete(X,Length(X),1);
  UpdateAccumulator; UpdateOutput;
end;

{ ��������� ������� ������ ���������� � ������� ������ }
procedure TMainForm2.FormKeyPress(Sender: TObject; var Key: Char);
var Button: TButton;
begin
  case Key of
    Esc: ClearClick(Sender);
    Enter: EqualClick(Sender);
    '*': Multiply.Click;
    '/': Divide.Click;
    '+': Plus.Click;
    '-': Minus.Click;
    '.',',': Dot.Click;
    else begin
      Button:=TButton(FindComponent('Button'+Key));
      if Button<>nil then Button.Click;
    end;
  end;
end;

{ ��������� ������� ����������� ������ (* / + -) }
procedure TMainForm2.OperationClick(Sender: TObject);
begin
  EqualClick(Sender);
  SetMemory(Accumulator);
  Operator:=TButton(Sender).Caption[1];
  Accumulator:=0;
  UpdateOutput;
end;

{ ��������� ������� ������ ��������� }
procedure TMainForm2.EqualClick(Sender: TObject);
begin
  case Operator of
    '*': Accumulator:=Memory*Accumulator;
    '/': if Accumulator<>0 then Accumulator:=Memory/Accumulator else ShowMessage('        ������!'+#13#10+' ������� �� ����.');
    '+': Accumulator:=Memory+Accumulator;
    '-': Accumulator:=Memory-Accumulator;
  end;
  Operator:=' ';
  UpdateOutput;
  SetMemory(0);
  Flag:=True;
end;

{ ��������� ������� ������ +/- }
procedure TMainForm2.PlusMinusClick(Sender: TObject);
begin Accumulator:=-Accumulator; UpdateOutput; end;

end.