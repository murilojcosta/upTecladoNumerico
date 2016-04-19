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
  published
    { published declarations }
  end;

implementation

{ TTecladoNumerico }

procedure TupTecladoNumerico.AbreTecladoNumerico(aEditPreencher: TEdit);
begin
  if not Assigned(FFormTecladoNumerico) then
    FFormTecladoNumerico := TFrmTecladoNumerico.Create(Application);

  FFormTecladoNumerico.EdtPreencher      := TEdit(aEditPreencher);
  FFormTecladoNumerico.lblResultado.Text := aEditPreencher.Text;
  FFormTecladoNumerico.Show;
end;

end.
