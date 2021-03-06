unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,strUtils, ValEdit, ExtCtrls, Buttons,dec,
  ComCtrls, Menus,  unit3,unit2, configform,
  ToolWin, ActnPopup;
                                              
type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    muQuery: TADOQuery;
    BitBtn4: TBitBtn;
    PaintBox1: TPaintBox;
    muupdate: TADOCommand;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    BitBtn6: TBitBtn;


    PopupMenu1: TPopupMenu;
    editarcmteditini1: TMenuItem;
    Creditos1: TMenuItem;
    procedure Creditos1Click(Sender: TObject);
    procedure EditarCMTEditini1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure lerguilds;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure iniciar;
    procedure infor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   bmp:array of tbitmap;
                                                      
implementation

uses Unit4, Unit5;



{$R *.dfm}

function bytetohex(src: byte): string;   {byte-->hex}
begin
  setlength(result, 2);
  asm
  mov edi, [result]
  mov edi, [edi]
  mov al, src
  mov ah, al // 保存至 ah
  shr al, 4 // 输出高4位
  add al, '0'
  cmp al, '9'
  jbe @@outcharlo
  add al, 'a'-'9'-1
@@outcharlo:
  and ah, $f
  add ah, '0'
  cmp ah, '9'
  jbe @@outchar
  add ah, 'a'-'9'-1
@@outchar:
  stosw
  end;
end;




function FillHexguild(item:Tfield;cor:Tcolor;tamanho:byte;esp:boolean): tbitmap; {填充某个账户的仓库}
type Tcharset=set of char;
var A:tcharset;
    itemblock:array of byte;
    sWS,sItem,sUni:string;
    wsrow,wscol,i,panelcount:integer;
    j,k,c1,c2,c3,c4:integer;
      bmps:tbitmap;
    tam:int64;
begin
 bmps:=tbitmap.create;
  tam:=tamanho;

     bmps.height:=(tam*8)+2;
      bmps.width:=(tam*8)+2;

  a:=['0'..'7'];
  with item do begin
      setlength(itemblock,datasize);
      try
      getdata(itemblock);
      {截取仓库的16进制代码}
      i:=2;
      while i<=high(itemblock) do
      begin
        sws:=sws+uppercase(bytetohex(itemblock[i]));
        inc(i);
      end;

{      for i:=2 to high(itemblock) do
          sws:=sws+uppercase(bytetohex(itemblock[i]));
 }

      for wscol:=1 to 8 do
        for wsrow:=1 to 8 do
          begin
            sitem:=midstr(sws,8*((wscol)-1)+1*((wsrow)-1)+1,1);
           // form1.canvas.pen.Width:=8;
      //      form1.Canvas.Pen.Mode := pmnotXor;

            if (sitem='0') then
              bmps.Canvas.Pen.Color:=cor;
            if (sitem='1') then
              bmps.Canvas.Pen.Color:=$000000;
            if (sitem='2') then
              bmps.Canvas.Pen.Color:=$8c8a8d;
            if (sitem='3') then
              bmps.Canvas.Pen.Color:=$ffffff;
            if (sitem='4') then
              bmps.Canvas.Pen.Color:=$0000fe;
            if (sitem='5') then
              bmps.Canvas.Pen.Color:=$008aff;
            if (sitem='6') then
              bmps.Canvas.Pen.Color:=$ffff00;
            if (sitem='7') then
              bmps.Canvas.Pen.Color:=$01FF8D;
            if (sitem='8') then
              bmps.Canvas.Pen.Color:=$00ff00;
            if (sitem='9') then
              bmps.Canvas.Pen.Color:=$8CFF01;
            if (sitem='A') then
              bmps.Canvas.Pen.Color:=$00ffff;
            if (sitem='B') then
              bmps.Canvas.Pen.Color:=$ff8a00;
            if (sitem='C') then
              bmps.Canvas.Pen.Color:=$fe0000;
            if (sitem='D') then
              bmps.Canvas.Pen.Color:=$FF008C;
            if (sitem='E') then
              bmps.Canvas.Pen.Color:=$ff00fe;
            if (sitem='F') then
              bmps.Canvas.Pen.Color:=$8C00FF;
           // form1.Canvas.Ellipse(139+8*(wsrow), 8*(wscol), 139+8*(wsrow)+8, 8*(wscol)+8);

           c1:=tam*(wsrow)-tam+1;
             c2:=tam*(wscol)-tam+1;
             c3:=tam*(wsrow);
             c4:=tam*(wscol);

            bmps.Canvas.Rectangle(c1,c2 , c3, c4);


            for j := 0 to tam-1 do
              begin
                c1:=1+tam*(wsrow)-tam;
                c2:=1+tam*(wscol)+j-tam;
                c3:=1+tam*(wsrow);
                c4:=1+tam*(wscol)+j-tam;
                bmps.Canvas.MoveTo(c1, c2);
				      	bmps.Canvas.LineTo(c3,c4 );
              end;

         end;
         bmps.Canvas.Pen.Color:=clblack;
         if esp=true then
           begin

             for j := 1 to tam do
               begin
                c1:=(j*tam-1)+1;
                c2:=1;
                c3:=(j*tam-1)+1;
                c4:=(tam*tam);
                bmps.Canvas.MoveTo(c1, c2);
				       	bmps.Canvas.LineTo(c3,c4 );
               end;
             for j := 1 to tam do
               begin
                c1:=1;
                c2:=(j*tam-1)+1;
                c3:=tam*tam;
                c4:=(j*tam-1)+1;
                bmps.Canvas.MoveTo(c1, c2);
				      	bmps.Canvas.LineTo(c3,c4 );
               end;
           end;
             c1:=0;
             c2:=0*tam;
             c3:=(tam*8)+1;
             c4:=0*tam;
             bmps.Canvas.MoveTo(c1, c2);
				     bmps.Canvas.LineTo(c3,c4 );
             c1:=0*tam;
             c2:=0;
             c3:=0*tam;
             c4:=(tam*8)+1;
             bmps.Canvas.MoveTo(c1, c2);
				     bmps.Canvas.LineTo(c3,c4 );

             c1:=0;
             c2:=(tam*8)+1;
             c3:=(tam*8)+1;
             c4:=(tam*8)+1;
             bmps.Canvas.MoveTo(c1, c2);
				     bmps.Canvas.LineTo(c3,c4 );
             c1:=(tam*8)+1;
             c2:=0;
             c3:=(tam*8)+1;
             c4:=(tam*8)+1;
             bmps.Canvas.MoveTo(c1, c2);
				     bmps.Canvas.LineTo(c3,c4 );
             bmps.canvas.pixels[c3,c4]:=clblack;

   result:=bmps;

    //  result.canvas.BrushCopy(Bounds(0, 0, Bmp.Width,
//Bmp.Height), Bmp, Bounds(0, 0, Bmp.Width, Bmp.Height), clRed);
      except
      on E:exception do application.MessageBox(pchar(e.Message),'Erro',mb_ok+mb_iconerror);


      end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
form4.show;
form4.iniciar;
form1.Enabled:=false;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if combobox1.text<>'' then
  begin
    if application.MessageBox(pchar(question11),'Guild Editor',mb_yesno+mb_iconinformation)=mrno then begin
      exit;
    end;
    muupdate.CommandText:=('delete from '+guildmember+' where '+G_name2+'='''+combobox1.Text+'''');
    muupdate.Execute;
    muupdate.CommandText:=('delete from '+guild+' where '+G_name+'='''+combobox1.Text+'''');
    muupdate.Execute;
    application.MessageBox(pchar(confirm3),'Guild Editor',mb_ok);
    lerguilds;
    combobox1.Itemindex:=0;
    infor;
  end
    else application.MessageBox(pchar(error19),pchar(errorcaption),mb_ok+mb_iconerror);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
if combobox1.Text<>'' then                        
  begin
    guildsave:=combobox1.Text;
    form2.caption:=EditGuildForm+' '+guildsave+'';
    form2.show;
    form2.iniciar;
    form1.Enabled:=false;
  end
    else application.MessageBox(pchar(error19),pchar(errorcaption),mb_ok+mb_iconerror);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
form1.Enabled:=false;
form5.show;
form5.iniciar;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var  pt:tpoint;
begin
  getcursorpos(pt);
  bitbtn6.PopupMenu.Popup(pt.x,pt.Y);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  infor;
end;

procedure TForm1.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);

var
Bitmap: TBitmap;
Offset: Integer;

begin
with (Control as TComboBox).Canvas do
begin
//color:=$00c56a31;
//FillRect(Rect);

FillRect(Rect); Bitmap:= TBitmap(ComboBox1.Items.Objects[index]);
if Bitmap<>nil then
begin
BrushCopy(Bounds(Rect.Left + 4, Rect.Top + 4, Bitmap.Width,
Bitmap.Height), Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);
Offset:= Bitmap.width + 8;
end else Offset:=41;
TextOut(Rect.Left + Offset, Rect.Top+13, ComboBox1.Items[index]);
end;
end;




procedure TForm1.ComboBox1MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
Height:=41;
end;

procedure TForm1.Creditos1Click(Sender: TObject);
begin
  form3.Caption:=creditstext;
  form3.Label2.Caption:=OtherFiles;
  form3.Label4.Caption:=translate;
  form3.showmodal;
end;

procedure TForm1.EditarCMTEditini1Click(Sender: TObject);
begin
 cfgform.iniciar;
 configtype:='using';
 cfgform.Button4.Visible:=false;
 cfgform.showmodal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
for I := 0 to maxguilds-1 do
  bmp[i].free;


application.Terminate;
end;

procedure TForm1.FormPaint(Sender: TObject);
var bmps2:tbitmap;
begin
  if combobox1.Text<>'' then
    begin
      muquery.SQL.clear;
      muquery.SQL.Add('select '+G_mark+','+G_Master+','+G_Score+' from '+guild+' where '+G_name+'='''+combobox1.text+'''');
      muquery.Open;
      label5.caption:=muquery.Fields[1].asstring;
      label1.caption:=score+muquery.fields[2].asstring;
      bmps2:=tbitmap.create;
      bmps2:=FillHexguild(muquery.fields[0],form1.color,8,true);
      form1.paintbox1.canvas.BrushCopy(Bounds(0, 0, Bmps2.Width,
bmps2.Height), Bmps2, Bounds(0, 0, Bmps2.Width, Bmps2.Height), clRed);
      bmps2.free;
      muquery.Close;
    end;
end;

procedure tform1.infor;
var s:string;
i:integer;
begin
  muquery.SQL.clear;
  muquery.SQL.Add('select '+G_mark+','+G_Master+','+G_Score+' from '+guild+' where '+G_name+'='''+combobox1.text+'''');
  muquery.Open;
  label5.caption:=muquery.Fields[1].asstring;
  label1.caption:=score+muquery.fields[2].asstring;
 // ;
  muquery.Close;
  muquery.SQL.clear;
  if vs<>'CMT' then begin
    muquery.SQL.Add('select '+nome2+' from '+guildmember+' where '+G_name2+'='''+combobox1.text+'''');
    muquery.Open;
    label2.Caption:=members+inttostr(muquery.RecordCount);
    muquery.close;
  end else begin
    muquery.SQL.Add('select '+nome2+','+G_Status+' from '+guildmember+' where '+G_name2+'='''+combobox1.text+'''');
    muquery.Open;
    s:='';
    label6.caption:=assistent2;
    label7.caption:=battlemasters;
    for i := 0 to muquery.RecordCount - 1 do
      begin
        if muquery.Fields[1].AsInteger=64 then label6.Caption:=assistent2+' '+muquery.Fields[0].asstring;
        if muquery.Fields[1].AsInteger=32 then
          if s='' then s:=muquery.Fields[0].asstring
            else s:=s+' , '+muquery.Fields[0].asstring;
        muquery.Next;
      end;
    label7.caption:=battlemasters+' '+s;
    label2.Caption:=members+' '+inttostr(muquery.RecordCount);
    muquery.close;
  end;
end;

procedure tform1.iniciar;
var i:integer;
  g,caption,cap2:string;
begin

  caption:='UIZPQWESFAXQCGHLQMQY|\Q$NOV';
  cap2:='';
  for I := 0 to length(caption) do
    begin
      if caption[i]='U' then cap2:=cap2+'C';
      if caption[i]='I' then cap2:=cap2+'M';
      if caption[i]='Z' then cap2:=cap2+'';
      if caption[i]='P' then cap2:=cap2+'T';
      if caption[i]='Q' then cap2:=cap2+' ';
      if caption[i]='W' then cap2:=cap2+'';
      if caption[i]='E' then cap2:=cap2+'Gu';
      if caption[i]='S' then cap2:=cap2+'i';
      if caption[i]='F' then cap2:=cap2+'l';
      if caption[i]='A' then cap2:=cap2+'d';
      if caption[i]='X' then cap2:=cap2+'';
      if caption[i]='C' then cap2:=cap2+'Ed';
      if caption[i]='G' then cap2:=cap2+'i';
      if caption[i]='H' then cap2:=cap2+'t';
      if caption[i]='L' then cap2:=cap2+'or';
      if caption[i]='M' then cap2:=cap2+'by';
      if caption[i]='N' then cap2:=cap2+'1.';
      if caption[i]='O' then cap2:=cap2+'1';
      if caption[i]='Y' then cap2:=cap2+'un';
      if caption[i]='$' then cap2:=cap2+'[';
      if caption[i]='V' then cap2:=cap2+']';
      if caption[i]='|' then cap2:=cap2+'ne';
      if caption[i]='\' then cap2:=cap2+'on';
    end;
  form1.Caption:=cap2;
  caption:='UIOPQWESFAVQCGHLQMQY|\Q$NOV';
  cap2:='';
  for I := 0 to length(caption) do
    begin
      if caption[i]='U' then cap2:=cap2+'C';
      if caption[i]='I' then cap2:=cap2+'M';
      if caption[i]='O' then cap2:=cap2+'';
      if caption[i]='P' then cap2:=cap2+'T';
      if caption[i]='Q' then cap2:=cap2+' ';
      if caption[i]='W' then cap2:=cap2+'';
      if caption[i]='E' then cap2:=cap2+'Gu';
      if caption[i]='S' then cap2:=cap2+'i';
      if caption[i]='F' then cap2:=cap2+'l';
      if caption[i]='A' then cap2:=cap2+'d';
      if caption[i]='V' then cap2:=cap2+'';
      if caption[i]='C' then cap2:=cap2+'Ed';
      if caption[i]='G' then cap2:=cap2+'i';
      if caption[i]='H' then cap2:=cap2+'t';
      if caption[i]='L' then cap2:=cap2+'or';
      if caption[i]='M' then cap2:=cap2+'by';
      if caption[i]='N' then cap2:=cap2+'';
      if caption[i]='O' then cap2:=cap2+'';
      if caption[i]='Y' then cap2:=cap2+'un';
      if caption[i]='$' then cap2:=cap2+'';
      if caption[i]='V' then cap2:=cap2+'';
      if caption[i]='|' then cap2:=cap2+'ne';
      if caption[i]='\' then cap2:=cap2+'on';
    end;
  statusbar1.Panels[1].Text:=cap2;
  caption:='2345678790-=';
  cap2:='';
  for I := 0 to length(caption) do
    begin
      if caption[i]='2' then cap2:=cap2+'P';
      if caption[i]='3' then cap2:=cap2+'r';
      if caption[i]='4' then cap2:=cap2+'og';
      if caption[i]='5' then cap2:=cap2+'ra';
      if caption[i]='6' then cap2:=cap2+'m';
      if caption[i]='7' then cap2:=cap2+' ';
      if caption[i]='8' then cap2:=cap2+'by ';
      if caption[i]='9' then cap2:=cap2+'U';
      if caption[i]='0' then cap2:=cap2+'n';
      if caption[i]='-' then cap2:=cap2+'e';
      if caption[i]='=' then cap2:=cap2+'on';
    end;
  form3.label3.caption:=cap2;
  caption:='CltETXorXFzund';
  cap2:='';
  for I := 0 to length(caption) do
    begin
      if caption[i]='C' then cap2:=cap2+'L';
      if caption[i]='l' then cap2:=cap2+'oa';
      if caption[i]='t' then cap2:=cap2+'d';
      if caption[i]='E' then cap2:=cap2+'i';
      if caption[i]='T' then cap2:=cap2+'ng';
      if caption[i]='X' then cap2:=cap2+' ';
      if caption[i]='o' then cap2:=cap2+'b';
      if caption[i]='r' then cap2:=cap2+'y';
      if caption[i]='F' then cap2:=cap2+'S';
      if caption[i]='z' then cap2:=cap2+'tr';
      if caption[i]='u' then cap2:=cap2+'i';
      if caption[i]='n' then cap2:=cap2+'k';
      if caption[i]='d' then cap2:=cap2+'er';
    end;
  form3.label5.caption:=cap2;
  caption:='QergomybHI鏫';
  cap2:='';
  for I := 0 to length(caption) do
    begin
      if caption[i]='Q' then cap2:=cap2+'G';
      if caption[i]='e' then cap2:=cap2+'u';
      if caption[i]='r' then cap2:=cap2+'i';
      if caption[i]='g' then cap2:=cap2+'l';
      if caption[i]='o' then cap2:=cap2+'';
      if caption[i]='m' then cap2:=cap2+'d';
      if caption[i]='y' then cap2:=cap2+' ';
      if caption[i]='b' then cap2:=cap2+'E';
      if caption[i]='H' then cap2:=cap2+'d';
      if caption[i]='I' then cap2:=cap2+'it';
      if caption[i]='�' then cap2:=cap2+'o';
      if caption[i]='\' then cap2:=cap2+'r';
    end;
  form3.label1.caption:=cap2;
  programname:=cap2;
  setlength(bmp,maxguilds);
  for I := 0 to maxguilds-1 do
    bmp[i]:=tbitmap.create;
  muquery.ConnectionString:='Provider=MSDASQL.1;Password='+mupwd+';Persist Security Info=True;User ID='+muid+';Data Source='+mudsn+';Initial Catalog='+catalog;
  muupdate.ConnectionString:=muquery.ConnectionString;
  form2.muquery.ConnectionString:=muquery.ConnectionString;
  form2.muupdate.connectionstring:=muquery.ConnectionString;
  form2.muquery2.ConnectionString:=muquery.ConnectionString;
  form4.muquery.ConnectionString:=muquery.ConnectionString;
  form4.muquery2.ConnectionString:=muquery.ConnectionString;
  form4.muupdate.connectionstring:=muquery.ConnectionString;
  form5.muquery.ConnectionString:=muquery.ConnectionString;
  form5.muupdate.connectionstring:=muquery.ConnectionString;

  lerguilds;
  form1.Update;
  combobox1.ItemIndex:=0;
  //lang
  with form1 do
    begin
      label9.caption:=guildtext;
      bitbtn1.Hint:=Addhint;
      bitbtn2.Hint:=remhint;
      bitbtn3.Hint:=edithint;
      bitbtn4.Hint:=tophint;
      label4.caption:=gm;
      label1.caption:=score;
      label2.caption:=members;
      editarcmteditini1.caption:=editcmtedit;
      creditos1.Caption:=creditstext;
      bitbtn6.hint:=options;
      label6.caption:=assistent2;
      label7.caption:=battlemasters;
    end;
  with form2 do
    begin
      label4.Caption:=gm;
      label1.caption:=score;
      label6.caption:=notice;
      groupbox1.Caption:=members;
      bitbtn1.caption:=rem;
      bitbtn2.caption:=add;
      bitbtn9.caption:=setgm;
      groupbox2.Caption:=addmember;
      label2.caption:=accounttext;
      label3.caption:=charactertext;
      bitbtn3.caption:=ok;
      bitbtn4.caption:=cancel;
      bitbtn5.caption:=ok;
      bitbtn6.caption:=cancel;
      caption:=EditGuildForm;
      bitbtn7.caption:=setassistent;
      bitbtn8.caption:=setbattlemaster;
      label7.Caption:=guildmaster;
      label8.caption:=assistent;
      label9.caption:=battlemaster;
      label10.Caption:=normalplayer;
    end;
  with form3 do
    begin
      label4.caption:=Translate;
      label2.caption:=otherfiles;
      caption:=creditstext;
    end;
  with form4 do
    begin
      label4.Caption:=guildtext;
      label1.caption:=accounttext;
      label2.caption:=charactertext;
      groupbox1.Caption:=selectgm;
      bitbtn5.caption:=NewGuild;
      bitbtn1.caption:=NewEditGuild;
      bitbtn6.caption:=Cancel;
      caption:=AddGuildForm;
    end;
  with form5 do
    begin
      groupbox1.Caption:=dec.info;
      label4.Caption:=gm;
      label1.caption:=score;
      label2.caption:=members;
      bitbtn2.Hint:=remhint;
      bitbtn3.Hint:=edithint;
      bitbtn1.caption:=RefreshList;
      bitbtn4.caption:=CloseTop;
      caption:=TopForm;
    end;
  //langend
  if (vs='WZ') or (vs='CMT') or (vs='DT') then
    begin
      vs:='CMT';
      label6.visible:=true;
      label7.visible:=true;
      form5.label6.visible:=true;
      form5.label7.visible:=true;
      form2.label8.visible:=true;
      form2.label9.visible:=true;
      form2.label10.visible:=true;
      form2.BitBtn7.Visible:=true;
      form2.BitBtn8.Visible:=true;
    end
      else begin
        label6.visible:=false;
        label7.visible:=false;
        form5.label6.visible:=false;
        form5.label7.visible:=false;
        form2.label8.visible:=false;
        form2.label9.visible:=false;
        form2.label10.visible:=false;
        form2.BitBtn7.Visible:=false;
        form2.BitBtn8.Visible:=false;
      end;
 form1.Caption:=form1.caption+' ('+vs+')';
infor;



  form1.Update;
  cap2:=ParamStr(1);
  if (cap2<>'') and (cap2[1]='$')  then
  begin
    g:='';
    for i:=2 to length(cap2) do
      g:=g+cap2[i];
    for i:=0 to Combobox1.Items.Count-1 do
      if Combobox1.Items[i]=g then
      begin
        Combobox1.ItemIndex:=i;
        form1.ComboBox1Change(Combobox1);
      end;
  end;
end;

procedure tform1.lerguilds;
var
  i , j , wsrow , wscol:integer;
begin
  combobox1.Items.clear;
  muquery.SQL.clear;
  muquery.SQL.Add('select '+G_name+','+G_mark+' from '+guild+'');
  muquery.Open;
  if (muquery.Eof) and (muquery.Bof) then
     application.MessageBox(pchar(error10),pchar(errorcaption),mb_iconwarning)
    else
      begin
        for i:=0 to muquery.RecordCount-1 do
          begin
            bmp[i]:=FillHexguild(muquery.fields[1],$00C56A31,4,false);
            ComboBox1.Items.AddObject(muquery.Fields[0].asstring,bmp[i]);
            muquery.Next;

          end;
      end;
  muquery.Close;
  combobox1.text:='';
  combobox1.ItemIndex:=-1;
  label5.caption:='';
  LABEL1.Caption:=score;
  for wsrow:=1 to 8 do
    for wscol:=1 to 8 do
      begin
        form1.paintbox1.Canvas.Pen.Color:=clBtnFace;
        form1.paintbox1.Canvas.Rectangle(8*(wsrow)-8, 8*(wscol)-8, 8*(wsrow), 8*(wscol));
        for j := 1 to 7 do
          begin
            form1.paintbox1.Canvas.MoveTo(8*(wsrow)-8, 8*(wscol)+j-8);
      	  	form1.paintbox1.Canvas.LineTo(8*(wsrow), 8*(wscol)+j-8);
          end;
      end;

end;

end.
