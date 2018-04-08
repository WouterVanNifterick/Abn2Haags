unit Abn2Haags.Language;

interface

type
  TTranslation=record
    ABN:string;
    Haags:string;
  end;

  TCombination=record
    SeparateWords:TArray<string>;
    Combined:string;
  end;

const
  WholeWords:array[0..42] of TTranslation = (
    (ABN:'als'        ; Haags:'as'         ),
    (ABN:'waarom'     ; Haags:'warom'      ),
    (ABN:'mazzel'     ; Haags:'mazzol'     ),
    (ABN:'kan'        ; Haags:'ken'        ),
    (ABN:'kun'        ; Haags:'ken'        ),
    (ABN:'zo'         ; Haags:'zau'        ),
    (ABN:'ligt'       ; Haags:'leg'        ),
    (ABN:'lig'        ; Haags:'leg'        ),
    (ABN:'liggen'     ; Haags:'legge'      ),
    (ABN:'eens'       ; Haags:'es'         ),
    (ABN:'heeft'      ; Haags:'hep'        ),
    (ABN:'aan'        ; Haags:'an'         ),
    (ABN:'gaan'       ; Haags:'gan'        ),
    (ABN:'nou'        ; Haags:'nâh'        ),
    (ABN:'een'        ; Haags:'un'         ),
    (ABN:'geen'       ; Haags:'gein'       ),
    (ABN:'even'       ; Haags:'effe'       ),
    (ABN:'chips'      ; Haags:'sjips'      ),
    (ABN:'tram'       ; Haags:'trem'       ),
    (ABN:'flat'       ; Haags:'flet'       ),
    (ABN:'hoofd'      ; Haags:'hauf'       ),
    (ABN:'delft'      ; Haags:'delluf'     ),
    (ABN:'geld'       ; Haags:'poen'       ),
    (ABN:'officiele'  ; Haags:'offesjeile' ),
    (ABN:'ophouden'   ; Haags:'afnokke'    ),
    (ABN:'gek'        ; Haags:'wâhs'       ),
    (ABN:'eten'       ; Haags:'nassen'     ),
    (ABN:'moet'       ; Haags:'mot'        ),
    (ABN:'moeten'     ; Haags:'motte'      ),
    (ABN:'achterlijk' ; Haags:'megoâhl'    ),
    (ABN:'gozer'      ; Haags:'gauzâh'     ),
    (ABN:'helemaal'   ; Haags:'heilemaal'  ),
    (ABN:'welnee'     ; Haags:'welnei'     ),
    (ABN:'verleden'   ; Haags:'veleide'    ),
    (ABN:'origineel'  ; Haags:'orresjineel'),
    (ABN:'vanavond'   ; Haags:'venavond'   ),
    (ABN:'hagenees'   ; Haags:'Hageneis'   ),
    (ABN:'weinig'     ; Haags:'wènag'      ),
    (ABN:'portie'     ; Haags:'pogsie'     ),
    (ABN:'vertrouwen' ; Haags:'vetrâhwuh'  ),
    (ABN:'geleden'    ; Haags:'geleije'    ),
    (ABN:'voetbal'    ; Haags:'foebal'     ),
    (ABN:'mongool'    ; Haags:'megaul'     )
  );

  Combinations:array[0..30] of TCombination = (
    (SeparateWords:['of'   ,'ik'  ];Combined:'offik'  ),
    (SeparateWords:['niet' ,'dan' ];Combined:'niettan'),
    (SeparateWords:['hebt' ,'het' ];Combined:'heppet' ),
    (SeparateWords:['als'  ,'je'  ];Combined:'asje'   ),
    (SeparateWords:['op'   ,'de'  ];Combined:'opte'   ),
    (SeparateWords:['als'  ,'ik'  ];Combined:'azzik'  ),
    (SeparateWords:['en'   ,'het' ];Combined:'ennet'  ),
    (SeparateWords:['van'  ,'de'  ];Combined:'vande'  ),
    (SeparateWords:['van'  ,'het' ];Combined:'vannut' ),
    (SeparateWords:['dat'  ,'het' ];Combined:'dattut' ),
    (SeparateWords:['doet' ,'het' ];Combined:'doettut'),
    (SeparateWords:['met'  ,'ons' ];Combined:'mettons'),
    (SeparateWords:['Den'  ,'Haag'];Combined:'De Haag'),
    (SeparateWords:['moet' ,'die' ];Combined:'mottie' ),
    (SeparateWords:['moet' ,'hij' ];Combined:'mottie' ),
    (SeparateWords:['moet' ,'zij' ];Combined:'mot ze' ),
    (SeparateWords:['dat'  ,'je'  ];Combined:'dajje'  ),
    (SeparateWords:['ken'  ,'ik'  ];Combined:'kennik' ),
    (SeparateWords:['kan'  ,'ik'  ];Combined:'kennik' ),
    (SeparateWords:['ken'  ,'je'  ];Combined:'kejje'  ),
    (SeparateWords:['kan'  ,'je'  ];Combined:'kejje'  ),
    (SeparateWords:['kun'  ,'je'  ];Combined:'kejje'  ),
    (SeparateWords:['kun'  ,'je'  ];Combined:'kejje'  ),
    (SeparateWords:['dacht','het' ];Combined:'dachut' ),
    (SeparateWords:['van'  ,'jou' ];Combined:'vajjâh' ),
    (SeparateWords:['als'  ,'er'  ];Combined:'alster' ),
    (SeparateWords:['je'   ,'zelf'];Combined:'je ège' ),
    (SeparateWords:['val'  ,'ik'  ];Combined:'vallik' ),
    (SeparateWords:['bent' ,'een' ];Combined:'bennun' ),
    (SeparateWords:['is'   ,'een' ];Combined:'issun'  ),
    (SeparateWords:['net'  ,'als' ];Combined:'nettas' )
  );


implementation

end.
