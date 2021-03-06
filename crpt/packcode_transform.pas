{ GS1 interface library for FPC and Lazarus

  Copyright (C) 2020 Lagunov Aleksey alexs75@yandex.ru

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

unit packcode_transform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlobject, LP_base_types_v2, AbstractSerializationObjects;

type
  Taoguid = String;
  Thouseguid = String;
  Tflat = String;
type

  {  Forward declarations  }
  Tfias_address_type = class;
  Tshipment_children_products_list_type = class;
  Tshipment_children_products_list_type_product = class;
  Tacceptance_children_products_list_type = class;
  Tacceptance_children_products_list_type_product = class;
  Tvvod_children_products_list_type = class;
  Tvvod_children_products_list_type_product = class;
  Tvvod_ind_children_products_list_type = class;
  Tvvod_ind_children_products_list_type_product = class;
  Tvvod_ost_children_products_list_type = class;
  Tvvod_ost_children_products_list_type_product = class;
  Tvvod_crossborder_products_list_type = class;
  Tvvod_crossborder_products_list_type_product = class;
  Tvvod_fts_children_list_type = class;
  Tvvod_fts_children_list_type_product = class;
  Treaggregation = class;
  Treaggregation_element = class;
  Treaggregation_product_list = class;
  Treaggregation_product_list_packing_product = class;

  {  Generic classes for collections  }
  Tfias_address_typeList = specialize GXMLSerializationObjectList<Tfias_address_type>;
  Tshipment_children_products_list_typeList = specialize GXMLSerializationObjectList<Tshipment_children_products_list_type>;
  Tshipment_children_products_list_type_productList = specialize GXMLSerializationObjectList<Tshipment_children_products_list_type_product>;
  Tacceptance_children_products_list_typeList = specialize GXMLSerializationObjectList<Tacceptance_children_products_list_type>;
  Tacceptance_children_products_list_type_productList = specialize GXMLSerializationObjectList<Tacceptance_children_products_list_type_product>;
  Tvvod_children_products_list_typeList = specialize GXMLSerializationObjectList<Tvvod_children_products_list_type>;
  Tvvod_children_products_list_type_productList = specialize GXMLSerializationObjectList<Tvvod_children_products_list_type_product>;
  Tvvod_ind_children_products_list_typeList = specialize GXMLSerializationObjectList<Tvvod_ind_children_products_list_type>;
  Tvvod_ind_children_products_list_type_productList = specialize GXMLSerializationObjectList<Tvvod_ind_children_products_list_type_product>;
  Tvvod_ost_children_products_list_typeList = specialize GXMLSerializationObjectList<Tvvod_ost_children_products_list_type>;
  Tvvod_ost_children_products_list_type_productList = specialize GXMLSerializationObjectList<Tvvod_ost_children_products_list_type_product>;
  Tvvod_crossborder_products_list_typeList = specialize GXMLSerializationObjectList<Tvvod_crossborder_products_list_type>;
  Tvvod_crossborder_products_list_type_productList = specialize GXMLSerializationObjectList<Tvvod_crossborder_products_list_type_product>;
  Tvvod_fts_children_list_typeList = specialize GXMLSerializationObjectList<Tvvod_fts_children_list_type>;
  Tvvod_fts_children_list_type_productList = specialize GXMLSerializationObjectList<Tvvod_fts_children_list_type_product>;
  TreaggregationList = specialize GXMLSerializationObjectList<Treaggregation>;
  Treaggregation_elementList = specialize GXMLSerializationObjectList<Treaggregation_element>;
  Treaggregation_product_listList = specialize GXMLSerializationObjectList<Treaggregation_product_list>;
  Treaggregation_product_list_packing_productList = specialize GXMLSerializationObjectList<Treaggregation_product_list_packing_product>;

  {  Tfias_address_type  }
  //Адрес в формате ФИАС
  Tfias_address_type = class(TXmlSerializationObject)
  private
    Faoguid:Taoguid;
    Fhouseguid:Thouseguid;
    Fflat:Tflat;
    procedure Setaoguid( AValue:Taoguid);
    procedure Sethouseguid( AValue:Thouseguid);
    procedure Setflat( AValue:Tflat);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Глобальный уникальный идентификатор адресного объекта
    property aoguid:Taoguid read Faoguid write Setaoguid;
    //Глобальный уникальный идентификатор дома. Обязателен при наличии
    property houseguid:Thouseguid read Fhouseguid write Sethouseguid;
    //Квартира. Обязателен при наличии
    property flat:Tflat read Fflat write Setflat;
  end;

  {  Tshipment_children_products_list_type  }
  Tshipment_children_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tshipment_children_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ/КИТУ в составе транспортной упаковки (отгрузка)
    property product:Tshipment_children_products_list_type_productList read Fproduct;
  end;

  {  Tshipment_children_products_list_type_product  }
  Tshipment_children_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tki_type;
    Fkitu:Tkitu_type;
    Fcost:Tprice_type;
    Fvat_value:Tprice_type;
    Fchildren_products_list:Tshipment_children_products_list_type;
    procedure Setki( AValue:Tki_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Setcost( AValue:Tprice_type);
    procedure Setvat_value( AValue:Tprice_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tki_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Цена за единицу
    property cost:Tprice_type read Fcost write Setcost;
    //Сумма НДС
    property vat_value:Tprice_type read Fvat_value write Setvat_value;
    //Список КИ\КИТУ составе транспортной упаковки (отгрузка)
    property children_products_list:Tshipment_children_products_list_type read Fchildren_products_list;
  end;

  {  Tacceptance_children_products_list_type  }
  Tacceptance_children_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tacceptance_children_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ\КИТУ в составе транспортной упаковки (приемка)
    property product:Tacceptance_children_products_list_type_productList read Fproduct;
  end;

  {  Tacceptance_children_products_list_type_product  }
  Tacceptance_children_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tki_type;
    Fkitu:Tkitu_type;
    Faccept_type:Boolean;
    Fchildren_products_list:Tacceptance_children_products_list_type;
    procedure Setki( AValue:Tki_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Setaccept_type( AValue:Boolean);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tki_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Товар принят
    property accept_type:Boolean read Faccept_type write Setaccept_type;
    //Список КИ\КИТУ в составе транспортной упаковки (приемка)
    property children_products_list:Tacceptance_children_products_list_type read Fchildren_products_list;
  end;

  {  Tvvod_children_products_list_type  }
  Tvvod_children_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tvvod_children_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот
    property product:Tvvod_children_products_list_type_productList read Fproduct;
  end;

  {  Tvvod_children_products_list_type_product  }
  Tvvod_children_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tkit_type;
    Fkitu:Tkitu_type;
    Fproduct_date:Tdate_type;
    Ftnved_code:Ttnved_code_type;
    Fcertificate_type:Tcertificate_type_type;
    Fcertificate_number:Tstring255_type;
    Fcertificate_date:Tdate_type;
    Fvvod_children_products_list:Tvvod_children_products_list_type;
    procedure Setki( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Setproduct_date( AValue:Tdate_type);
    procedure Settnved_code( AValue:Ttnved_code_type);
    procedure Setcertificate_type( AValue:Tcertificate_type_type);
    procedure Setcertificate_number( AValue:Tstring255_type);
    procedure Setcertificate_date( AValue:Tdate_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tkit_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Дата производства
    property product_date:Tdate_type read Fproduct_date write Setproduct_date;
    //Код ТН ВЭД ЕАС товара
    property tnved_code:Ttnved_code_type read Ftnved_code write Settnved_code;
    //Вид документа, подтверждающего соответствие
    property certificate_type:Tcertificate_type_type read Fcertificate_type write Setcertificate_type;
    //Номер документа, подтверждающего соответствие
    property certificate_number:Tstring255_type read Fcertificate_number write Setcertificate_number;
    //Дата документа, подтверждающего соответствие
    property certificate_date:Tdate_type read Fcertificate_date write Setcertificate_date;
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот
    property vvod_children_products_list:Tvvod_children_products_list_type read Fvvod_children_products_list;
  end;

  {  Tvvod_ind_children_products_list_type  }
  Tvvod_ind_children_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tvvod_ind_children_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот (полученных от физических лиц)
    property product:Tvvod_ind_children_products_list_type_productList read Fproduct;
  end;

  {  Tvvod_ind_children_products_list_type_product  }
  Tvvod_ind_children_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tkit_type;
    Fkitu:Tkitu_type;
    Fproduct_receiving_date:Tdate_type;
    Fvvod_ind_children_products_list:Tvvod_ind_children_products_list_type;
    procedure Setki( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Setproduct_receiving_date( AValue:Tdate_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tkit_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Дата получения товара
    property product_receiving_date:Tdate_type read Fproduct_receiving_date write Setproduct_receiving_date;
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот (полученных от физических лиц)
    property vvod_ind_children_products_list:Tvvod_ind_children_products_list_type read Fvvod_ind_children_products_list;
  end;

  {  Tvvod_ost_children_products_list_type  }
  Tvvod_ost_children_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tvvod_ost_children_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот (остатки)
    property product:Tvvod_ost_children_products_list_type_productList read Fproduct;
  end;

  {  Tvvod_ost_children_products_list_type_product  }
  Tvvod_ost_children_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tkit_type;
    Fkitu:Tkitu_type;
    Fvvod_ost_children_products_list:Tvvod_ost_children_products_list_type;
    procedure Setki( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tkit_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот (остатки)
    property vvod_ost_children_products_list:Tvvod_ost_children_products_list_type read Fvvod_ost_children_products_list;
  end;

  {  Tvvod_crossborder_products_list_type  }
  Tvvod_crossborder_products_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tvvod_crossborder_products_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ\КИТУ в составе транспортной упаковки для ввода в оборот (трансграничная торговля)
    property product:Tvvod_crossborder_products_list_type_productList read Fproduct;
  end;

  {  Tvvod_crossborder_products_list_type_product  }
  Tvvod_crossborder_products_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tkit_type;
    Fkitu:Tkitu_type;
    Ftnved_code:Ttnved_code_type;
    Fcost:Tprice_type;
    Fvat_value:Tprice_type;
    Fcertificate_type:Tcertificate_type_type;
    Fcertificate_number:Tstring255_type;
    Fcertificate_date:Tdate_type;
    Fchildren_products_list:Tvvod_crossborder_products_list_type;
    procedure Setki( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Settnved_code( AValue:Ttnved_code_type);
    procedure Setcost( AValue:Tprice_type);
    procedure Setvat_value( AValue:Tprice_type);
    procedure Setcertificate_type( AValue:Tcertificate_type_type);
    procedure Setcertificate_number( AValue:Tstring255_type);
    procedure Setcertificate_date( AValue:Tdate_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ
    property ki:Tkit_type read Fki write Setki;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Код ТН ВЭД ЕАС товара
    property tnved_code:Ttnved_code_type read Ftnved_code write Settnved_code;
    //Цена за единицу
    property cost:Tprice_type read Fcost write Setcost;
    //Сумма НДС
    property vat_value:Tprice_type read Fvat_value write Setvat_value;
    //Вид документа, подтверждающего соответствие
    property certificate_type:Tcertificate_type_type read Fcertificate_type write Setcertificate_type;
    //Номер документа, подтверждающего соответствие
    property certificate_number:Tstring255_type read Fcertificate_number write Setcertificate_number;
    //Дата документа, подтверждающего соответствие
    property certificate_date:Tdate_type read Fcertificate_date write Setcertificate_date;
    //Список КИ/КИТУ в составе транспортной упаковки для ввода в оборот (трансграничная торговля)
    property children_products_list:Tvvod_crossborder_products_list_type read Fchildren_products_list;
  end;

  {  Tvvod_fts_children_list_type  }
  Tvvod_fts_children_list_type = class(TXmlSerializationObject)
  private
    Fproduct:Tvvod_fts_children_list_type_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Список КИ/КИТУ в составе КИТУ/АТК для ввода в оборот импортных товаров с ФТС
    property product:Tvvod_fts_children_list_type_productList read Fproduct;
  end;

  {  Tvvod_fts_children_list_type_product  }
  Tvvod_fts_children_list_type_product = class(TXmlSerializationObject)
  private
    Fki:Tkit_type;
    Fkitu:Tkitu_type;
    Fcolor:Tstring1024_type;
    Fproduct_size:Tshoe_size;
    Fvvod_fts_children_list_type:Tvvod_fts_children_list_type;
    procedure Setki( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
    procedure Setcolor( AValue:Tstring1024_type);
    procedure Setproduct_size( AValue:Tshoe_size);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИ (код идентификации)
    property ki:Tkit_type read Fki write Setki;
    //КИТУ (код идентификации транспортной упаковки)
    property kitu:Tkitu_type read Fkitu write Setkitu;
    //Цвет. Параметр обязателен для ТГ "Обувь"
    property color:Tstring1024_type read Fcolor write Setcolor;
    //Размер в штихмассовой системе. Параметр обязателен для ТГ "Обувь"
    property product_size:Tshoe_size read Fproduct_size write Setproduct_size;
    //Список КИ/КИТУ в составе КИТУ/АТК для ввода в оборот импортных товаров с ФТС
    property vvod_fts_children_list_type:Tvvod_fts_children_list_type read Fvvod_fts_children_list_type;
  end;

  {  Treaggregation  }
  //Трансформация транспортных упаковок
  Treaggregation = class(TXmlSerializationObject)
  private
    Ftrade_participant_inn:Tinn_type;
    Freaggregation_type:Treaggregation_type_type;
    Freaggregating_kitu:Tkitu_type;
    Fproduct_list:Treaggregation_product_list;
    Faction_id:Longint;
    Fversion:String;
    procedure Settrade_participant_inn( AValue:Tinn_type);
    procedure Setreaggregation_type( AValue:Treaggregation_type_type);
    procedure Setreaggregating_kitu( AValue:Tkitu_type);
    procedure Setaction_id( AValue:Longint);
    procedure Setversion( AValue:String);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //ИНН участника оборота
    property trade_participant_inn:Tinn_type read Ftrade_participant_inn write Settrade_participant_inn;
    //Тип трансформации
    //Изъятие - REMOVING
    //Добавление - ADDING
    property reaggregation_type:Treaggregation_type_type read Freaggregation_type write Setreaggregation_type;
    //Код идентификации трансформируемой транспортной упаковки (КИТУ)
    property reaggregating_kitu:Tkitu_type read Freaggregating_kitu write Setreaggregating_kitu;
    //Список транспортных упаковок или товаров
    property product_list:Treaggregation_product_list read Fproduct_list;
    property action_id:Longint read Faction_id write Setaction_id;
    property version:String read Fversion write Setversion;
  end;

  {  Treaggregation_element  }
  Treaggregation_element = class(Treaggregation)
  private
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
    function RootNodeName:string; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
  end;

  {  Treaggregation_product_list  }
  Treaggregation_product_list = class(TXmlSerializationObject)
  private
    Fpacking_product:Treaggregation_product_list_packing_productList;
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //Транспортная упаковка или товар
    property packing_product:Treaggregation_product_list_packing_productList read Fpacking_product;
  end;

  {  Treaggregation_product_list_packing_product  }
  Treaggregation_product_list_packing_product = class(TXmlSerializationObject)
  private
    Fkit:Tkit_type;
    Fkitu:Tkitu_type;
    procedure Setkit( AValue:Tkit_type);
    procedure Setkitu( AValue:Tkitu_type);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    //КИТ
    property kit:Tkit_type read Fkit write Setkit;
    //КИТУ
    property kitu:Tkitu_type read Fkitu write Setkitu;
  end;

implementation

  {  Tfias_address_type  }
procedure Tfias_address_type.Setaoguid(AValue: Taoguid);
begin
  CheckStrMinSize('aoguid', AValue);
  CheckStrMaxSize('aoguid', AValue);
  Faoguid:=AValue;
  ModifiedProperty('aoguid');
end;

procedure Tfias_address_type.Sethouseguid(AValue: Thouseguid);
begin
  CheckStrMinSize('houseguid', AValue);
  CheckStrMaxSize('houseguid', AValue);
  Fhouseguid:=AValue;
  ModifiedProperty('houseguid');
end;

procedure Tfias_address_type.Setflat(AValue: Tflat);
begin
  CheckStrMinSize('flat', AValue);
  CheckStrMaxSize('flat', AValue);
  Fflat:=AValue;
  ModifiedProperty('flat');
end;

procedure Tfias_address_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('aoguid', 'aoguid', [xsaSimpleObject], '', 36, 36);
  P:=RegisterProperty('houseguid', 'houseguid', [xsaSimpleObject], '', 36, 36);
  P:=RegisterProperty('flat', 'flat', [xsaSimpleObject], '', 1, 20);
end;

procedure Tfias_address_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor Tfias_address_type.Destroy;
begin
  inherited Destroy;
end;

constructor Tfias_address_type.Create;
begin
  inherited Create;
end;

  {  Tshipment_children_products_list_type  }
procedure Tshipment_children_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tshipment_children_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tshipment_children_products_list_type_productList.Create;
end;

destructor Tshipment_children_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tshipment_children_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tshipment_children_products_list_type_product  }
procedure Tshipment_children_products_list_type_product.Setki(AValue: Tki_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tshipment_children_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tshipment_children_products_list_type_product.Setcost(AValue: Tprice_type);
begin
  CheckMinInclusiveValue('cost', AValue);
  Fcost:=AValue;
  ModifiedProperty('cost');
end;

procedure Tshipment_children_products_list_type_product.Setvat_value(AValue: Tprice_type);
begin
  CheckMinInclusiveValue('vat_value', AValue);
  Fvat_value:=AValue;
  ModifiedProperty('vat_value');
end;

procedure Tshipment_children_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('cost', 'cost', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
    P.minInclusiveFloat:=0;
  P:=RegisterProperty('vat_value', 'vat_value', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
    P.minInclusiveFloat:=0;
  P:=RegisterProperty('children_products_list', 'children_products_list', [], '', -1, -1);
end;

procedure Tshipment_children_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fchildren_products_list:=Tshipment_children_products_list_type.Create;
end;

destructor Tshipment_children_products_list_type_product.Destroy;
begin
  Fchildren_products_list.Free;
  inherited Destroy;
end;

constructor Tshipment_children_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tacceptance_children_products_list_type  }
procedure Tacceptance_children_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tacceptance_children_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tacceptance_children_products_list_type_productList.Create;
end;

destructor Tacceptance_children_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tacceptance_children_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tacceptance_children_products_list_type_product  }
procedure Tacceptance_children_products_list_type_product.Setki(AValue: Tki_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tacceptance_children_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tacceptance_children_products_list_type_product.Setaccept_type(AValue: Boolean);
begin
  Faccept_type:=AValue;
  ModifiedProperty('accept_type');
end;

procedure Tacceptance_children_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('accept_type', 'accept_type', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('children_products_list', 'children_products_list', [], '', -1, -1);
end;

procedure Tacceptance_children_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fchildren_products_list:=Tacceptance_children_products_list_type.Create;
end;

destructor Tacceptance_children_products_list_type_product.Destroy;
begin
  Fchildren_products_list.Free;
  inherited Destroy;
end;

constructor Tacceptance_children_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tvvod_children_products_list_type  }
procedure Tvvod_children_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tvvod_children_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tvvod_children_products_list_type_productList.Create;
end;

destructor Tvvod_children_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tvvod_children_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tvvod_children_products_list_type_product  }
procedure Tvvod_children_products_list_type_product.Setki(AValue: Tkit_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tvvod_children_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tvvod_children_products_list_type_product.Setproduct_date(AValue: Tdate_type);
begin
  CheckStrMinSize('product_date', AValue);
  CheckStrMaxSize('product_date', AValue);
  Fproduct_date:=AValue;
  ModifiedProperty('product_date');
end;

procedure Tvvod_children_products_list_type_product.Settnved_code(AValue: Ttnved_code_type);
begin
  Ftnved_code:=AValue;
  ModifiedProperty('tnved_code');
end;

procedure Tvvod_children_products_list_type_product.Setcertificate_type(AValue: Tcertificate_type_type);
begin
  CheckLockupValue('certificate_type', AValue);
  Fcertificate_type:=AValue;
  ModifiedProperty('certificate_type');
end;

procedure Tvvod_children_products_list_type_product.Setcertificate_number(AValue: Tstring255_type);
begin
  CheckStrMinSize('certificate_number', AValue);
  CheckStrMaxSize('certificate_number', AValue);
  Fcertificate_number:=AValue;
  ModifiedProperty('certificate_number');
end;

procedure Tvvod_children_products_list_type_product.Setcertificate_date(AValue: Tdate_type);
begin
  CheckStrMinSize('certificate_date', AValue);
  CheckStrMaxSize('certificate_date', AValue);
  Fcertificate_date:=AValue;
  ModifiedProperty('certificate_date');
end;

procedure Tvvod_children_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('product_date', 'product_date', [xsaSimpleObject], '', 10, 10);
  P:=RegisterProperty('tnved_code', 'tnved_code', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('certificate_type', 'certificate_type', [xsaSimpleObject], '', -1, -1);
    P.ValidList.Add('CONFORMITY_CERTIFICATE');
    P.ValidList.Add('CONFORMITY_DECLARATION');
  P:=RegisterProperty('certificate_number', 'certificate_number', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('certificate_date', 'certificate_date', [xsaSimpleObject], '', 10, 10);
  P:=RegisterProperty('vvod_children_products_list', 'vvod_children_products_list', [], '', -1, -1);
end;

procedure Tvvod_children_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fvvod_children_products_list:=Tvvod_children_products_list_type.Create;
end;

destructor Tvvod_children_products_list_type_product.Destroy;
begin
  Fvvod_children_products_list.Free;
  inherited Destroy;
end;

constructor Tvvod_children_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tvvod_ind_children_products_list_type  }
procedure Tvvod_ind_children_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tvvod_ind_children_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tvvod_ind_children_products_list_type_productList.Create;
end;

destructor Tvvod_ind_children_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tvvod_ind_children_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tvvod_ind_children_products_list_type_product  }
procedure Tvvod_ind_children_products_list_type_product.Setki(AValue: Tkit_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tvvod_ind_children_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tvvod_ind_children_products_list_type_product.Setproduct_receiving_date(AValue: Tdate_type);
begin
  CheckStrMinSize('product_receiving_date', AValue);
  CheckStrMaxSize('product_receiving_date', AValue);
  Fproduct_receiving_date:=AValue;
  ModifiedProperty('product_receiving_date');
end;

procedure Tvvod_ind_children_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('product_receiving_date', 'product_receiving_date', [xsaSimpleObject], '', 10, 10);
  P:=RegisterProperty('vvod_ind_children_products_list', 'vvod_ind_children_products_list', [], '', -1, -1);
end;

procedure Tvvod_ind_children_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fvvod_ind_children_products_list:=Tvvod_ind_children_products_list_type.Create;
end;

destructor Tvvod_ind_children_products_list_type_product.Destroy;
begin
  Fvvod_ind_children_products_list.Free;
  inherited Destroy;
end;

constructor Tvvod_ind_children_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tvvod_ost_children_products_list_type  }
procedure Tvvod_ost_children_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tvvod_ost_children_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tvvod_ost_children_products_list_type_productList.Create;
end;

destructor Tvvod_ost_children_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tvvod_ost_children_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tvvod_ost_children_products_list_type_product  }
procedure Tvvod_ost_children_products_list_type_product.Setki(AValue: Tkit_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tvvod_ost_children_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tvvod_ost_children_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('vvod_ost_children_products_list', 'vvod_ost_children_products_list', [], '', -1, -1);
end;

procedure Tvvod_ost_children_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fvvod_ost_children_products_list:=Tvvod_ost_children_products_list_type.Create;
end;

destructor Tvvod_ost_children_products_list_type_product.Destroy;
begin
  Fvvod_ost_children_products_list.Free;
  inherited Destroy;
end;

constructor Tvvod_ost_children_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tvvod_crossborder_products_list_type  }
procedure Tvvod_crossborder_products_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tvvod_crossborder_products_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tvvod_crossborder_products_list_type_productList.Create;
end;

destructor Tvvod_crossborder_products_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tvvod_crossborder_products_list_type.Create;
begin
  inherited Create;
end;

  {  Tvvod_crossborder_products_list_type_product  }
procedure Tvvod_crossborder_products_list_type_product.Setki(AValue: Tkit_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tvvod_crossborder_products_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tvvod_crossborder_products_list_type_product.Settnved_code(AValue: Ttnved_code_type);
begin
  Ftnved_code:=AValue;
  ModifiedProperty('tnved_code');
end;

procedure Tvvod_crossborder_products_list_type_product.Setcost(AValue: Tprice_type);
begin
  CheckMinInclusiveValue('cost', AValue);
  Fcost:=AValue;
  ModifiedProperty('cost');
end;

procedure Tvvod_crossborder_products_list_type_product.Setvat_value(AValue: Tprice_type);
begin
  CheckMinInclusiveValue('vat_value', AValue);
  Fvat_value:=AValue;
  ModifiedProperty('vat_value');
end;

procedure Tvvod_crossborder_products_list_type_product.Setcertificate_type(AValue: Tcertificate_type_type);
begin
  CheckLockupValue('certificate_type', AValue);
  Fcertificate_type:=AValue;
  ModifiedProperty('certificate_type');
end;

procedure Tvvod_crossborder_products_list_type_product.Setcertificate_number(AValue: Tstring255_type);
begin
  CheckStrMinSize('certificate_number', AValue);
  CheckStrMaxSize('certificate_number', AValue);
  Fcertificate_number:=AValue;
  ModifiedProperty('certificate_number');
end;

procedure Tvvod_crossborder_products_list_type_product.Setcertificate_date(AValue: Tdate_type);
begin
  CheckStrMinSize('certificate_date', AValue);
  CheckStrMaxSize('certificate_date', AValue);
  Fcertificate_date:=AValue;
  ModifiedProperty('certificate_date');
end;

procedure Tvvod_crossborder_products_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('tnved_code', 'tnved_code', [xsaSimpleObject], '', -1, -1);
  P:=RegisterProperty('cost', 'cost', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
    P.minInclusiveFloat:=0;
  P:=RegisterProperty('vat_value', 'vat_value', [xsaSimpleObject], '', -1, -1);
    P.TotalDigits := 19;
    P.FractionDigits := 2;
    P.minInclusiveFloat:=0;
  P:=RegisterProperty('certificate_type', 'certificate_type', [xsaSimpleObject], '', -1, -1);
    P.ValidList.Add('CONFORMITY_CERTIFICATE');
    P.ValidList.Add('CONFORMITY_DECLARATION');
  P:=RegisterProperty('certificate_number', 'certificate_number', [xsaSimpleObject], '', 1, 255);
  P:=RegisterProperty('certificate_date', 'certificate_date', [xsaSimpleObject], '', 10, 10);
  P:=RegisterProperty('children_products_list', 'children_products_list', [], '', -1, -1);
end;

procedure Tvvod_crossborder_products_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fchildren_products_list:=Tvvod_crossborder_products_list_type.Create;
end;

destructor Tvvod_crossborder_products_list_type_product.Destroy;
begin
  Fchildren_products_list.Free;
  inherited Destroy;
end;

constructor Tvvod_crossborder_products_list_type_product.Create;
begin
  inherited Create;
end;

  {  Tvvod_fts_children_list_type  }
procedure Tvvod_fts_children_list_type.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('product', 'product', [], '', -1, -1);
end;

procedure Tvvod_fts_children_list_type.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct:=Tvvod_fts_children_list_type_productList.Create;
end;

destructor Tvvod_fts_children_list_type.Destroy;
begin
  Fproduct.Free;
  inherited Destroy;
end;

constructor Tvvod_fts_children_list_type.Create;
begin
  inherited Create;
end;

  {  Tvvod_fts_children_list_type_product  }
procedure Tvvod_fts_children_list_type_product.Setki(AValue: Tkit_type);
begin
  CheckStrMinSize('ki', AValue);
  CheckStrMaxSize('ki', AValue);
  Fki:=AValue;
  ModifiedProperty('ki');
end;

procedure Tvvod_fts_children_list_type_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Tvvod_fts_children_list_type_product.Setcolor(AValue: Tstring1024_type);
begin
  CheckStrMinSize('color', AValue);
  CheckStrMaxSize('color', AValue);
  Fcolor:=AValue;
  ModifiedProperty('color');
end;

procedure Tvvod_fts_children_list_type_product.Setproduct_size(AValue: Tshoe_size);
begin
  CheckMinInclusiveValue('product_size', AValue);
  CheckMaxInclusiveValue('product_size', AValue);
  Fproduct_size:=AValue;
  ModifiedProperty('product_size');
end;

procedure Tvvod_fts_children_list_type_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('ki', 'ki', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('color', 'color', [xsaSimpleObject], '', 1, 1024);
  P:=RegisterProperty('product_size', 'product_size', [xsaSimpleObject], '', -1, -1);
    P.minInclusiveFloat:=14.5;
    P.maxInclusiveFloat:=47;
  P:=RegisterProperty('vvod_fts_children_list_type', 'vvod_fts_children_list_type', [], '', -1, -1);
end;

procedure Tvvod_fts_children_list_type_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fvvod_fts_children_list_type:=Tvvod_fts_children_list_type.Create;
end;

destructor Tvvod_fts_children_list_type_product.Destroy;
begin
  Fvvod_fts_children_list_type.Free;
  inherited Destroy;
end;

constructor Tvvod_fts_children_list_type_product.Create;
begin
  inherited Create;
end;

  {  Treaggregation  }
procedure Treaggregation.Settrade_participant_inn(AValue: Tinn_type);
begin
  CheckStrMinSize('trade_participant_inn', AValue);
  CheckStrMaxSize('trade_participant_inn', AValue);
  Ftrade_participant_inn:=AValue;
  ModifiedProperty('trade_participant_inn');
end;

procedure Treaggregation.Setreaggregation_type(AValue: Treaggregation_type_type);
begin
  CheckLockupValue('reaggregation_type', AValue);
  Freaggregation_type:=AValue;
  ModifiedProperty('reaggregation_type');
end;

procedure Treaggregation.Setreaggregating_kitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('reaggregating_kitu', AValue);
  CheckStrMaxSize('reaggregating_kitu', AValue);
  Freaggregating_kitu:=AValue;
  ModifiedProperty('reaggregating_kitu');
end;

procedure Treaggregation.Setaction_id(AValue: Longint);
begin
  CheckFixedValue('action_id', AValue);
  Faction_id:=AValue;
  ModifiedProperty('action_id');
end;

procedure Treaggregation.Setversion(AValue: String);
begin
  CheckFixedValue('version', AValue);
  Fversion:=AValue;
  ModifiedProperty('version');
end;

procedure Treaggregation.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('trade_participant_inn', 'trade_participant_inn', [xsaSimpleObject], '', 9, 12);
  P:=RegisterProperty('reaggregation_type', 'reaggregation_type', [xsaSimpleObject], '', -1, -1);
    P.ValidList.Add('REMOVING');
    P.ValidList.Add('ADDING');
  P:=RegisterProperty('reaggregating_kitu', 'reaggregating_kitu', [xsaSimpleObject], '', 18, 18);
  P:=RegisterProperty('product_list', 'product_list', [], '', -1, -1);
  P:=RegisterProperty('action_id', 'action_id', [xsaRequared], '', -1, -1);
    P.DefaultValue:='32';
  P:=RegisterProperty('version', 'version', [xsaRequared], '', -1, -1);
    P.DefaultValue:='2';
end;

procedure Treaggregation.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fproduct_list:=Treaggregation_product_list.Create;
end;

destructor Treaggregation.Destroy;
begin
  Fproduct_list.Free;
  inherited Destroy;
end;

constructor Treaggregation.Create;
begin
  inherited Create;
  action_id:=32;
  version:='2';
end;

  {  Treaggregation_element  }
procedure Treaggregation_element.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
end;

procedure Treaggregation_element.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor Treaggregation_element.Destroy;
begin
  inherited Destroy;
end;

function Treaggregation_element.RootNodeName:string;
begin
  Result:='reaggregation';
end;

constructor Treaggregation_element.Create;
begin
  inherited Create;
end;

  {  Treaggregation_product_list  }
procedure Treaggregation_product_list.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('packing_product', 'packing_product', [], '', -1, -1);
end;

procedure Treaggregation_product_list.InternalInitChilds;
begin
  inherited InternalInitChilds;
  Fpacking_product:=Treaggregation_product_list_packing_productList.Create;
end;

destructor Treaggregation_product_list.Destroy;
begin
  Fpacking_product.Free;
  inherited Destroy;
end;

constructor Treaggregation_product_list.Create;
begin
  inherited Create;
end;

  {  Treaggregation_product_list_packing_product  }
procedure Treaggregation_product_list_packing_product.Setkit(AValue: Tkit_type);
begin
  CheckStrMinSize('kit', AValue);
  CheckStrMaxSize('kit', AValue);
  Fkit:=AValue;
  ModifiedProperty('kit');
end;

procedure Treaggregation_product_list_packing_product.Setkitu(AValue: Tkitu_type);
begin
  CheckStrMinSize('kitu', AValue);
  CheckStrMaxSize('kitu', AValue);
  Fkitu:=AValue;
  ModifiedProperty('kitu');
end;

procedure Treaggregation_product_list_packing_product.InternalRegisterPropertys;
var
  P: TPropertyDef;
begin
  inherited InternalRegisterPropertys;
  P:=RegisterProperty('kit', 'kit', [xsaSimpleObject], '', 25, 45);
  P:=RegisterProperty('kitu', 'kitu', [xsaSimpleObject], '', 18, 18);
end;

procedure Treaggregation_product_list_packing_product.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor Treaggregation_product_list_packing_product.Destroy;
begin
  inherited Destroy;
end;

constructor Treaggregation_product_list_packing_product.Create;
begin
  inherited Create;
end;

end.
