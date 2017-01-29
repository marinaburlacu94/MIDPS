unit MainUnit_v1;

interface

uses Forms,StdCtrls,ExtCtrls,Classes,Controls,Buttons,SysUtils,Dialogs;

type
  TMainForm1 = class(TForm)
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
    Back: TSpeedButton;
    Dot: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Input(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OperationClick(Sender: TObject);
    procedure EqualClick(Sender: TObject);
    procedure PlusMinusClick(Sender: TObject);
  private
    procedure SetOutput(C: Char);
    procedure SetAccumulator;
  end;

var MainForm1: TMainForm1;

implementation
{$R *.dfm}

var
  Accumulator: Currency; // Текущий результат
  Memory: Currency; //Текущий результат
  Operator: Char;
  Flag: Boolean = False; // Этот флаг определяет продолжать, или начать заново ввод числа (по умолчанию - продолжать)

{ Обновление значения Accumulator текущей строкой ввода }
procedure TMainForm1.SetAccumulator;
begin
  if Output.Caption<>'' then
   try Accumulator:=StrToFloat(Output.Caption)
   except on E: Exception do ShowMessage('Ошибка ввода!'+#13#10+E.Message)
   end;
end;

{ Обновление значения Output.Caption текущим вводимым символом }
procedure TMainForm1.SetOutput(C: Char);
begin if C='C' then Output.Caption:='' else Output.Caption:=Output.Caption+C end;

{ Удаляет последний введённый символ }
procedure TMainForm1.BackClick(Sender: TObject);
var X: String;
begin
  X:=Output.Caption;
  if Length(X)=0 then X:='' else Delete(X,Length(X),1);
  Output.Caption:=X;
end;

{ Обработка нажатий на клавиши с цифрой (0-9) и др. }
procedure TMainForm1.Input(Sender: TObject);
begin
  if Flag then begin
    SetOutput('C');
    Flag:=False;
  end;
  if Sender.ClassName='TSpeedButton' then begin
    if Sender=Dot then begin
      if Output.Caption='' then SetOutput('0');
      SetOutput(',');
    end else SetOutput((Sender as TSpeedButton).Caption[1]);
  end;
end;

{ Отчищает текущий ввод }
procedure TMainForm1.ClearClick(Sender: TObject);
begin Accumulator:=0; SetOutput('C') end;

{ Обработка нажатия кнопки +/- }
procedure TMainForm1.PlusMinusClick(Sender: TObject);
begin SetAccumulator; Accumulator:=-Accumulator; Output.Caption:=FloatToStr(Accumulator); end;

{ Обработка нажатия операторной кнопки (* / + -) }
procedure TMainForm1.OperationClick(Sender: TObject);
begin
  SetAccumulator;
  EqualClick(Sender);
  Memory:=Accumulator;
  Operator:=TButton(Sender).Caption[1];
  Accumulator:=0;
  SetOutput('C');
end;

{ Обработка нажатия кнопки равенства }
procedure TMainForm1.EqualClick(Sender: TObject);
begin
  SetAccumulator;
  case Operator of
    '*': Accumulator:=Memory*Accumulator;
    '/': if Accumulator<>0 then Accumulator:=Memory/Accumulator else ShowMessage('        Ошибка!'+#13#10+' Деление на ноль.');
    '+': Accumulator:=Memory+Accumulator;
    '-': Accumulator:=Memory-Accumulator;
  end;
  Operator:=' ';
  Output.Caption:=FloatToStr(Accumulator);
  Memory:=0;
  Flag:=True;
end;

procedure TMainForm1.FormCreate(Sender: TObject);
begin Accumulator:=0; SetOutput('C'); Memory:=0; end;

{ Переводит нажатия клавиш клавиатуры в нажатие кнопок }
procedure TMainForm1.FormKeyPress(Sender: TObject; var Key: Char);
const Esc=#27; Enter=#13;
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

end.
