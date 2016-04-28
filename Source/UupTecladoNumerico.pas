unit UupTecladoNumerico;

interface

uses UFrmTecladoNumerico, FMX.Forms, FMX.Edit, System.Classes;

type
  TupTecladoNumerico = class(TComponent)
  private
    FFormTecladoNumerico: TFrmTecladoNumerico;
  protected
    { protected declarations }
  public
    procedure AbreTecladoNumerico(aEditPreencher: TEdit);
    destructor Destroy; override;
  published
    { published declarations }
  end;

implementation

uses
  System.SysUtils;

{ TTecladoNumerico }

procedure TupTecladoNumerico.AbreTecladoNumerico(aEditPreencher: TEdit);
begin
  if not Assigned(FFormTecladoNumerico) then
    FFormTecladoNumerico := TFrmTecladoNumerico.Create(Application);

  FFormTecladoNumerico.EdtPreencher      := TEdit(aEditPreencher);
  FFormTecladoNumerico.lblResultado.Text := aEditPreencher.Text;
  FFormTecladoNumerico.Show;

  FFormTecladoNumerico.SetBounds(TForm(Self.Owner).Top, TForm(Self.Owner).Left, TForm(Self.Owner).Width, TForm(Self.Owner).Height);
end;

destructor TupTecladoNumerico.Destroy;
begin
  if not Assigned(FFormTecladoNumerico) then
    FreeAndNil(FFormTecladoNumerico);
  inherited;
end;

end.
