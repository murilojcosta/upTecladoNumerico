unit UFrmTecladoNumerico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.Effects, Math, System.Rtti, System.Bindings.EvalProtocol, System.Bindings.Evaluator, System.Bindings.EvalSys;

  type
  TFrmTecladoNumerico = class(TForm)
    recFundo: TRectangle;
    lytAreaTeclado: TLayout;
    lytNumeroDigitado: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Label1: TLabel;
    btnApagar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConcluido: TSpeedButton;
    recFundoTeclado: TRectangle;
    ShadowEffect1: TShadowEffect;
    btn7: TSpeedButton;
    btn8: TSpeedButton;
    btn9: TSpeedButton;
    btnSomar: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    btnSubtrair: TSpeedButton;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btnMutiplicacao: TSpeedButton;
    btnVirgula: TSpeedButton;
    btn0: TSpeedButton;
    btnIgual: TSpeedButton;
    btnDividir: TSpeedButton;
    lblResultado: TLabel;
    imgErro: TImage;
    procedure AddDigitado(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConcluidoClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
  private
    FEdtPreencher: TEdit;
    function Calcula: Boolean;
  public

  published
    property EdtPreencher: TEdit read FEdtPreencher write FEdtPreencher;
  end;

implementation

{$R *.fmx}


procedure TFrmTecladoNumerico.AddDigitado(Sender: TObject);
begin
  imgErro.Visible := False;

  if not lblResultado.Text.EndsWith('+') and not lblResultado.Text.EndsWith('-')
  and not lblResultado.Text.EndsWith('*') and not lblResultado.Text.EndsWith('/') then
    lblResultado.Text := lblResultado.Text + (Sender as TSpeedButton).Text;
end;

procedure TFrmTecladoNumerico.btnApagarClick(Sender: TObject);
begin
  lblResultado.Text := lblResultado.Text.Remove(lblResultado.Text.Length-1);
end;

procedure TFrmTecladoNumerico.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTecladoNumerico.btnConcluidoClick(Sender: TObject);
begin
  if Calcula then
  begin
    FEdtPreencher.Text := lblResultado.Text;
    Close;
  end;
end;

procedure TFrmTecladoNumerico.btnIgualClick(Sender: TObject);
begin
  Calcula;
end;

function TFrmTecladoNumerico.Calcula: Boolean;
Var
  LScope : IScope;
  LCompiledExpr : ICompiledBinding;
  LResult : TValue;
begin
  try
    if not lblResultado.Text.IsEmpty then
    begin
      LScope:= BasicOperators;
      LCompiledExpr:= Compile(lblResultado.Text, LScope);
      LResult:=LCompiledExpr.Evaluate(LScope, nil, nil).GetValue;
      lblResultado.Text := LResult.ToString;
    end;
    imgErro.Visible := False;
    Result := True;
  except
    begin
      imgErro.Visible := True;
      Result := False;
    end;
  end;
end;

end.
