{ interface library for FPC and Lazarus

  Copyright (C) 2019 Lagunov Aleksey alexs75@yandex.ru

  Генерация xml файлов для электронного документооборота

  Структуры данных базируются на основании "Приказ ФНС РФ от 19.12.2018 N ММВ-7-15/820@"

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

unit InvoceDocument;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xml_doc, OrganizationInfo, AdditionalInfo, InvoiceItem,
  TransferInfo, Signer;

type

  { TInvoiceRevisionInfo }

  TInvoiceRevisionInfo = class(TXmlSerializationObject)  //%Таблица 5.6
  private
    FInvoiceRevisionDate: string;
    FInvoiceRevisionDateDef: string;
    FInvoiceRevisionNumber: Integer;
    FInvoiceRevisionNumberDef: string;
    procedure SetInvoiceRevisionDate(AValue: string);
    procedure SetInvoiceRevisionDateDef(AValue: string);
    procedure SetInvoiceRevisionNumber(AValue: Integer);
    procedure SetInvoiceRevisionNumberDef(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property InvoiceRevisionDate:string read FInvoiceRevisionDate write SetInvoiceRevisionDate;
    property InvoiceRevisionNumber:Integer read FInvoiceRevisionNumber write SetInvoiceRevisionNumber;
    property InvoiceRevisionDateDef:string read FInvoiceRevisionDateDef write SetInvoiceRevisionDateDef;
    property InvoiceRevisionNumberDef:string read FInvoiceRevisionNumberDef write SetInvoiceRevisionNumberDef;
  end;

  { TShipper }

  TShipper = class(TXmlSerializationObject) //%Таблица 5.7
  private
    FOrganization: TOrganizationInfo;
    FSameAsSeller: string;
    procedure SetSameAsSeller(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property Organization:TOrganizationInfo read FOrganization;
    property SameAsSeller:string read FSameAsSeller write SetSameAsSeller;
  end;

  { TShipperList }

  TShipperList = class(TXmlSerializationObjectList) //%Таблица 5.7
  private
    function GetItem(AIndex: Integer): TShipper; inline;
  public
    constructor Create;
    property Item[AIndex:Integer]:TShipper read GetItem;
  end;

  { TPaymentDocument }

  TPaymentDocument = class(TXmlSerializationObject) //%Таблица 5.8
  private
    FDocumentDate: string;
    FDocumentNumber: string;
    FDocumentSum: string;
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
    procedure SetDocumentSum(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property DocumentDate:string read FDocumentDate write SetDocumentDate;
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;
    property DocumentSum:string read FDocumentSum write SetDocumentSum;
  end;

  { TPaymentDocumentList }

  TPaymentDocumentList = class(TXmlSerializationObjectList) //%Таблица 5.8
  private
    function GetItem(AIndex: Integer): TPaymentDocument; inline;
  public
    constructor Create;
    property Item[AIndex:Integer]:TPaymentDocument read GetItem;
  end;

  { TSellerInformationForState }

  TSellerInformationForState = class(TXmlSerializationObject) //%Таблица 5.10
  private
    FDestinationCode: string;
    FGovernmentContractAccount: string;
    FGovernmentContractDate: string;
    FGovernmentContractNumber: string;
    FKBK: string;
    FTreasuryCode: string;
    FTreasuryName: string;
    procedure SetDestinationCode(AValue: string);
    procedure SetGovernmentContractAccount(AValue: string);
    procedure SetGovernmentContractDate(AValue: string);
    procedure SetGovernmentContractNumber(AValue: string);
    procedure SetKBK(AValue: string);
    procedure SetTreasuryCode(AValue: string);
    procedure SetTreasuryName(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property GovernmentContractDate:string read FGovernmentContractDate write SetGovernmentContractDate;
    property GovernmentContractNumber:string read FGovernmentContractNumber write SetGovernmentContractNumber;
    property GovernmentContractAccount:string read FGovernmentContractAccount write SetGovernmentContractAccount;
    property KBK:string read FKBK write SetKBK;
    property DestinationCode:string read FDestinationCode write SetDestinationCode;
    property TreasuryCode:string read FTreasuryCode write SetTreasuryCode;
    property TreasuryName:string read FTreasuryName write SetTreasuryName;
  end;


  { TAdditionalInformationOfLife1 }

  TAdditionalInformationOfLife1 = class(TXmlSerializationObject) //%Таблица 5.9
  private
    FCurrencyName: string;
    FCurrencyRate: string;
    FFactorInfo: TOrganizationInfo;
    FGovernmentContractInfo: string;
    FInvoceConditionsTax: string;
    FMonetaryRequestBase: TShipmentBase;
    FSellerInformationForState: TSellerInformationForState;
    procedure SetCurrencyName(AValue: string);
    procedure SetCurrencyRate(AValue: string);
    procedure SetGovernmentContractInfo(AValue: string);
    procedure SetInvoceConditionsTax(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property GovernmentContractInfo:string read FGovernmentContractInfo write SetGovernmentContractInfo;
    property CurrencyName:string read FCurrencyName write SetCurrencyName;
    property CurrencyRate:string read FCurrencyRate write SetCurrencyRate;
    property InvoceConditionsTax:string read FInvoceConditionsTax write SetInvoceConditionsTax;
    property SellerInformationForState:TSellerInformationForState read FSellerInformationForState;
    property FactorInfo:TOrganizationInfo read FFactorInfo;
    property MonetaryRequestBase:TShipmentBase read FMonetaryRequestBase;
  end;

  { TShipmentBaseConfirm }

  TShipmentBaseConfirm = class(TXmlSerializationObject) //%Таблица 5.11
  private
    FBaseDocumentDate: string;
    FBaseDocumentName: string;
    FBaseDocumentNumber: string;
    procedure SetBaseDocumentDate(AValue: string);
    procedure SetBaseDocumentName(AValue: string);
    procedure SetBaseDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property BaseDocumentName:string read FBaseDocumentName write SetBaseDocumentName;
    property BaseDocumentNumber:string read FBaseDocumentNumber write SetBaseDocumentNumber;
    property BaseDocumentDate:string read FBaseDocumentDate write SetBaseDocumentDate;
  end;

  { TShipmentBaseConfirmList }

  TShipmentBaseConfirmList = class(TXmlSerializationObjectList) //%Таблица 5.8
  private
    function GetItem(AIndex: Integer): TShipmentBaseConfirm; inline;
  public
    constructor Create;
    property Item[AIndex:Integer]:TShipmentBaseConfirm read GetItem;
  end;

  { TInvoiceInformation }

  TInvoiceInformation = class(TXmlSerializationObject) //%Таблица 5.5
  private
    FAdditionalInfo: TAdditionalInfo1;
    FAdditionalInformationOfLife1: TAdditionalInformationOfLife1;
    FBuyer: TOrganizationInfoList;
    FConsignee: TOrganizationInfoList;
    FCurrencyCode: string;
    FDocumentDate: string;
    FDocumentNumber: string;
    FInvoiceRevisionInfo: TInvoiceRevisionInfo;
    FPaymentDocuments: TPaymentDocumentList;
    FSeller: TOrganizationInfoList;
    FShipmentBaseConfirms: TShipmentBaseConfirmList;
    FShippers: TShipperList;
    procedure SetCurrencyCode(AValue: string);
    procedure SetDocumentDate(AValue: string);
    procedure SetDocumentNumber(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property DocumentNumber:string read FDocumentNumber write SetDocumentNumber;
    property DocumentDate:string read FDocumentDate write SetDocumentDate;
    property CurrencyCode:string read FCurrencyCode write SetCurrencyCode;
    property InvoiceRevisionInfo:TInvoiceRevisionInfo read FInvoiceRevisionInfo;
    property Seller:TOrganizationInfoList read FSeller;
    property Shippers:TShipperList read FShippers;
    property Consignee:TOrganizationInfoList read FConsignee;
    property PaymentDocuments:TPaymentDocumentList read FPaymentDocuments;
    property Buyer:TOrganizationInfoList read FBuyer;
    property AdditionalInformationOfLife1:TAdditionalInformationOfLife1 read FAdditionalInformationOfLife1;
    property ShipmentBaseConfirms:TShipmentBaseConfirmList read FShipmentBaseConfirms;
    property AdditionalInfo:TAdditionalInfo1 read FAdditionalInfo;
  end;

  { TInvoceDocument }

  TInvoceDocument = class(TXmlSerializationObject) //%Таблица 5.4
  private
    FDocFunction: string;
    FDocumentCreator: string;
    FDocumentCreatorBase: string;
    FDocumentName: string;
    FDocumentNameEL: string;
    FInformationAvailabilityStructureAdditionalInfo: string;
    FInvoceDateCreate: string;
    FInvoceTimeCreate: string;
    FInvoiceInformation: TInvoiceInformation;
    FInvoiceItems: TInvoiceItems;
    FKND: string;
    FSigners: TSignerList;
    FTransferInfo: TTransferInfo;
    procedure SetDocFunction(AValue: string);
    procedure SetDocumentCreator(AValue: string);
    procedure SetDocumentCreatorBase(AValue: string);
    procedure SetDocumentName(AValue: string);
    procedure SetDocumentNameEL(AValue: string);
    procedure SetInformationAvailabilityStructureAdditionalInfo(AValue: string);
    procedure SetInvoceDateCreate(AValue: string);
    procedure SetInvoceTimeCreate(AValue: string);
    procedure SetKND(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    property KND:string read FKND write SetKND;
    property DocFunction:string read FDocFunction write SetDocFunction;
    property DocumentNameEL:string read FDocumentNameEL write SetDocumentNameEL;
    property DocumentName:string read FDocumentName write SetDocumentName;
    property InvoceDateCreate:string read FInvoceDateCreate write SetInvoceDateCreate;
    property InvoceTimeCreate:string read FInvoceTimeCreate write SetInvoceTimeCreate;
    property DocumentCreator:string read FDocumentCreator write SetDocumentCreator;
    property DocumentCreatorBase:string read FDocumentCreatorBase write SetDocumentCreatorBase;
    property InformationAvailabilityStructureAdditionalInfo:string read FInformationAvailabilityStructureAdditionalInfo write SetInformationAvailabilityStructureAdditionalInfo;
    property InvoiceInformation:TInvoiceInformation read FInvoiceInformation;
    property InvoiceItems:TInvoiceItems read FInvoiceItems;
    property TransferInfo:TTransferInfo read FTransferInfo;
    property Signers:TSignerList read FSigners;
  end;

implementation

{ TShipmentBaseConfirm }

procedure TShipmentBaseConfirm.SetBaseDocumentDate(AValue: string);
begin
  if FBaseDocumentDate=AValue then Exit;
  FBaseDocumentDate:=AValue;
  ModifiedProperty('BaseDocumentDate');
end;

procedure TShipmentBaseConfirm.SetBaseDocumentName(AValue: string);
begin
  if FBaseDocumentName=AValue then Exit;
  FBaseDocumentName:=AValue;
  ModifiedProperty('BaseDocumentName');
end;

procedure TShipmentBaseConfirm.SetBaseDocumentNumber(AValue: string);
begin
  if FBaseDocumentNumber=AValue then Exit;
  FBaseDocumentNumber:=AValue;
  ModifiedProperty('BaseDocumentNumber');
end;

procedure TShipmentBaseConfirm.InternalRegisterPropertys;
begin
  RegisterProperty('BaseDocumentName', 'НаимДокОтгр', 'О', 'Наименование документа об отгрузке', 1, 255);
  RegisterProperty('BaseDocumentNumber', 'НомДокОтгр', 'О', 'Номер документа об отгрузке', 1, 255);
  RegisterProperty('BaseDocumentDate', 'ДатаДокОтгр', 'Н', 'Дата документа об отгрузке', 10, 10);
end;

procedure TShipmentBaseConfirm.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TShipmentBaseConfirm.Destroy;
begin
  inherited Destroy;
end;

{ TShipmentBaseConfirmList }

function TShipmentBaseConfirmList.GetItem(AIndex: Integer
  ): TShipmentBaseConfirm;
begin
  Result:=TShipmentBaseConfirm(InternalGetItem(AIndex));
end;

constructor TShipmentBaseConfirmList.Create;
begin
  inherited Create(TShipmentBaseConfirm);
end;

{ TSellerInformationForState }

procedure TSellerInformationForState.SetDestinationCode(AValue: string);
begin
  if FDestinationCode=AValue then Exit;
  FDestinationCode:=AValue;
  ModifiedProperty('DestinationCode');
end;

procedure TSellerInformationForState.SetGovernmentContractAccount(AValue: string
  );
begin
  if FGovernmentContractAccount=AValue then Exit;
  FGovernmentContractAccount:=AValue;
  ModifiedProperty('GovernmentContractAccount');
end;

procedure TSellerInformationForState.SetGovernmentContractDate(AValue: string);
begin
  if FGovernmentContractDate=AValue then Exit;
  FGovernmentContractDate:=AValue;
  ModifiedProperty('GovernmentContractDate');
end;

procedure TSellerInformationForState.SetGovernmentContractNumber(AValue: string
  );
begin
  if FGovernmentContractNumber=AValue then Exit;
  FGovernmentContractNumber:=AValue;
  ModifiedProperty('GovernmentContractNumber');
end;

procedure TSellerInformationForState.SetKBK(AValue: string);
begin
  if FKBK=AValue then Exit;
  FKBK:=AValue;
  ModifiedProperty('KBK');
end;

procedure TSellerInformationForState.SetTreasuryCode(AValue: string);
begin
  if FTreasuryCode=AValue then Exit;
  FTreasuryCode:=AValue;
  ModifiedProperty('TreasuryCode');
end;

procedure TSellerInformationForState.SetTreasuryName(AValue: string);
begin
  if FTreasuryName=AValue then Exit;
  FTreasuryName:=AValue;
  ModifiedProperty('TreasuryName');
end;

procedure TSellerInformationForState.InternalRegisterPropertys;
begin
  RegisterProperty('GovernmentContractDate', 'ДатаГосКонт', 'О', 'Дата государственного контракта', 10, 10);
  RegisterProperty('GovernmentContractNumber', 'НомерГосКонт', 'О', 'Номер государственного контракта', 1, 100);
  RegisterProperty('GovernmentContractAccount', 'ЛицСчетПрод', 'Н', 'Номер лицевого счета продавца', 11, 11);
  RegisterProperty('KBK', 'КодПродБюджКласс', 'НК', 'Код по бюджетной классификации (продавец)', 20, 20);
  RegisterProperty('DestinationCode', 'КодЦелиПрод', 'Код цели (продавец)', 'НК', 20, 20);
  RegisterProperty('TreasuryCode', 'КодКазначПрод', 'НК', 'Код территориального органа Федерального казначейства продавца', 1, 4);
  RegisterProperty('TreasuryName', 'НаимКазначПрод', 'НК', 'Наименование территориального органа Федерального казначейства продавца', 1, 2000);
end;

procedure TSellerInformationForState.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TSellerInformationForState.Destroy;
begin
  inherited Destroy;
end;

{ TAdditionalInformationOfLife1 }

procedure TAdditionalInformationOfLife1.SetGovernmentContractInfo(AValue: string
  );
begin
  if FGovernmentContractInfo=AValue then Exit;
  FGovernmentContractInfo:=AValue;
  ModifiedProperty('GovernmentContractInfo');
end;

procedure TAdditionalInformationOfLife1.SetInvoceConditionsTax(AValue: string);
begin
  if FInvoceConditionsTax=AValue then Exit;
  FInvoceConditionsTax:=AValue;
  ModifiedProperty('InvoceConditionsTax');
end;

procedure TAdditionalInformationOfLife1.SetCurrencyName(AValue: string);
begin
  if FCurrencyName=AValue then Exit;
  FCurrencyName:=AValue;
  ModifiedProperty('CurrencyName');
end;

procedure TAdditionalInformationOfLife1.SetCurrencyRate(AValue: string);
begin
  if FCurrencyRate=AValue then Exit;
  FCurrencyRate:=AValue;
  ModifiedProperty('CurrencyRate');
end;

procedure TAdditionalInformationOfLife1.InternalRegisterPropertys;
begin
  RegisterProperty('GovernmentContractInfo', 'ИдГосКон', 'Н', 'Обязателен при наличии государственного контракта на поставку товаров (выполнение работ, оказание услуг), договора (соглашения) о предоставлении из федерального бюджета юридическому лицу субсидий, бюджетных инвестиций, взносов в уставный капитал', 20, 25);
  RegisterProperty('CurrencyName', 'НаимОКВ', 'НК', 'Валюта: Наименование', 1, 100);
  RegisterProperty('CurrencyRate', 'КурсВал', 'Н', 'Курс валюты', 1, 10);
  RegisterProperty('InvoceConditionsTax', 'ОбстФормСЧФ', 'Н', 'Обстоятельства формирования счета-фактуры, применяемого при расчетах по налогу на добавленную стоимость', 1, 1);
  RegisterProperty('SellerInformationForState', 'ИнфПродГосЗакКазн', 'Н', 'Информация продавца об обстоятельствах закупок для государственных и муниципальных нужд (для учета Федеральным казначейством денежных обязательств)', -1, -1);
  RegisterProperty('FactorInfo', 'СвФактор', 'Н', 'Сведения о факторе', -1, -1);
  RegisterProperty('MonetaryRequestBase', 'ОснУстДенТреб', 'Н', 'Основание уступки денежного требования', -1, -1);
end;

procedure TAdditionalInformationOfLife1.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FSellerInformationForState:=TSellerInformationForState.Create;
  FFactorInfo:=TOrganizationInfo.Create;
  FMonetaryRequestBase:=TShipmentBase.Create;
end;

destructor TAdditionalInformationOfLife1.Destroy;
begin
  FreeAndNil(FSellerInformationForState);
  FreeAndNil(FFactorInfo);
  FreeAndNil(FMonetaryRequestBase);
  inherited Destroy;
end;

{ TPaymentDocument }

procedure TPaymentDocument.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TPaymentDocument.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TPaymentDocument.SetDocumentSum(AValue: string);
begin
  if FDocumentSum=AValue then Exit;
  FDocumentSum:=AValue;
  ModifiedProperty('DocumentSum');
end;

procedure TPaymentDocument.InternalRegisterPropertys;
begin
  RegisterProperty('DocumentDate', 'НомерПРД', 'О', 'Номер платежно-расчетного документа', 1, 30);
  RegisterProperty('DocumentNumber', 'ДатаПРД', 'О', 'Дата составления платежно-расчетного документа', 10, 10);
  RegisterProperty('DocumentSum', 'СуммаПРД', 'Н', 'Сумма', 1, 19);
end;

procedure TPaymentDocument.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TPaymentDocument.Destroy;
begin
  inherited Destroy;
end;

{ TPaymentDocumentList }

function TPaymentDocumentList.GetItem(AIndex: Integer): TPaymentDocument;
begin
  Result:=TPaymentDocument(InternalGetItem(AIndex));
end;

constructor TPaymentDocumentList.Create;
begin
  inherited Create(TPaymentDocument)
end;

{ TShipperList }

function TShipperList.GetItem(AIndex: Integer): TShipper;
begin
  Result:=TShipper(InternalGetItem(AIndex));
end;

constructor TShipperList.Create;
begin
  inherited Create(TShipper)
end;

{ TShipper }

procedure TShipper.SetSameAsSeller(AValue: string);
begin
  if FSameAsSeller=AValue then Exit;
  FSameAsSeller:=AValue;
  ModifiedProperty('SameAsSeller');
end;

procedure TShipper.InternalRegisterPropertys;
begin
  RegisterProperty('Organization', 'ГрузОтпр', 'О', 'Грузоотправитель и его адрес', -1, -1);
  RegisterProperty('SameAsSeller', 'ОнЖе', 'П', 'Указано "он же"', 5, 5);
end;

procedure TShipper.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FOrganization:=TOrganizationInfo.Create;
end;

destructor TShipper.Destroy;
begin
  FreeAndNil(FOrganization);
  inherited Destroy;
end;

{ TInvoiceRevisionInfo }

procedure TInvoiceRevisionInfo.SetInvoiceRevisionDate(AValue: string);
begin
  if FInvoiceRevisionDate=AValue then Exit;
  FInvoiceRevisionDate:=AValue;
  ModifiedProperty('InvoiceRevisionDate');
end;

procedure TInvoiceRevisionInfo.SetInvoiceRevisionDateDef(AValue: string);
begin
  if FInvoiceRevisionDateDef=AValue then Exit;
  FInvoiceRevisionDateDef:=AValue;
  ModifiedProperty('InvoiceRevisionDateDef');
end;

procedure TInvoiceRevisionInfo.SetInvoiceRevisionNumber(AValue: Integer);
begin
  if FInvoiceRevisionNumber=AValue then Exit;
  FInvoiceRevisionNumber:=AValue;
  ModifiedProperty('InvoiceRevisionNumber');
end;

procedure TInvoiceRevisionInfo.SetInvoiceRevisionNumberDef(AValue: string);
begin
  if FInvoiceRevisionNumberDef=AValue then Exit;
  FInvoiceRevisionNumberDef:=AValue;
  ModifiedProperty('InvoiceRevisionNumberDef');
end;

procedure TInvoiceRevisionInfo.InternalRegisterPropertys;
begin
  RegisterProperty('InvoiceRevisionDate', 'НомИспрСчФ', 'Н', 'Исправление: N', 0, 999);
  RegisterProperty('InvoiceRevisionNumber', 'ДефНомИспрСчФ', 'Н', 'Исправление: N (при составлении документа с Функция=СЧФ или Функция=СЧФДОП до внесения в него исправлений)', 1, 1);
  RegisterProperty('InvoiceRevisionDateDef', 'ДатаИспрСчФ', 'Н', 'Исправление: Дата', 10, 10);
  RegisterProperty('InvoiceRevisionNumberDef', 'ДефДатаИспрСчФ', 'Н', 'Исправление: Дата (при составлении документа с Функция=СЧФ или Функция=СЧФДОП до внесения в него исправлений)', 1, 1);
end;

procedure TInvoiceRevisionInfo.InternalInitChilds;
begin
  inherited InternalInitChilds;
end;

destructor TInvoiceRevisionInfo.Destroy;
begin
  inherited Destroy;
end;

{ TInvoiceInformation }

procedure TInvoiceInformation.SetDocumentDate(AValue: string);
begin
  if FDocumentDate=AValue then Exit;
  FDocumentDate:=AValue;
  ModifiedProperty('DocumentDate');
end;

procedure TInvoiceInformation.SetCurrencyCode(AValue: string);
begin
  if FCurrencyCode=AValue then Exit;
  FCurrencyCode:=AValue;
  ModifiedProperty('CurrencyCode');
end;

procedure TInvoiceInformation.SetDocumentNumber(AValue: string);
begin
  if FDocumentNumber=AValue then Exit;
  FDocumentNumber:=AValue;
  ModifiedProperty('DocumentNumber');
end;

procedure TInvoiceInformation.InternalRegisterPropertys;
begin
  RegisterProperty('DocumentNumber', 'НомерСчФ', 'О', 'Порядковый номер счета-фактуры (строка 1 счета-фактуры), документа об отгрузке товаров (выполнении работ), передаче имущественных прав (документа об оказании услуг)', 1, 1000);
  RegisterProperty('DocumentDate', 'ДатаСчФ', 'О', 'Дата составления (выписки) счета-фактуры (строка 1 счета-фактуры), документа об отгрузке товаров (выполнении работ), передаче имущественных прав (документа об оказании услуг)', 10, 10);
  RegisterProperty('CurrencyCode', 'КодОКВ', 'О', 'Валюта: Код (строка 7 счета-фактуры)', 3, 3);
  RegisterProperty('InvoiceRevisionInfo', 'ИспрСчФ', 'Н', 'Исправление (строка 1а счета - фактуры)', -1, -1);
  RegisterProperty('Seller', 'СвПрод', 'ОМ', 'Сведения о продавце (строки 2, 2а, 2б счета-фактуры)', -1, -1);
  RegisterProperty('Shippers', 'ГрузОт', 'НМ', 'Сведения о грузоотправителе (строка 3 счета-фактуры)', -1, -1);
  RegisterProperty('Consignee', 'ГрузПолуч', 'НМ', 'Грузополучатель и его адрес (строка 4 счета-фактуры)', -1, -1);
  RegisterProperty('PaymentDocuments', 'СвПРД', 'НМ', 'Сведения о платежно-расчетном документе (строка 5 счета-фактуры)', -1, -1);
  RegisterProperty('Buyer', 'СвПокуп', 'ОМ', 'Сведения о покупателе (строки 6, 6а, 6б счета-фактуры)', -1, -1);
  RegisterProperty('AdditionalInformationOfLife1', 'ДопСвФХЖ1', 'Н', 'Дополнительные сведения об участниках факта хозяйственной жизни, основаниях и обстоятельствах его проведения', -1, -1);
  RegisterProperty('ShipmentBaseConfirms', 'ДокПодтвОтгр', 'НМ', 'Реквизиты документа, подтверждающего отгрузку товаров (работ, услуг, имущественных прав)', -1, -1);
  RegisterProperty('AdditionalInfo', 'ИнфПолФХЖ1', 'Н', 'Информационное поле факта хозяйственной жизни 1', -1, -1);
end;

procedure TInvoiceInformation.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FInvoiceRevisionInfo:=TInvoiceRevisionInfo.Create;
  FSeller:=TOrganizationInfoList.Create;
  FShippers:=TShipperList.Create;
  FConsignee:=TOrganizationInfoList.Create;
  FPaymentDocuments:=TPaymentDocumentList.Create;
  FBuyer:=TOrganizationInfoList.Create;
  FAdditionalInformationOfLife1:=TAdditionalInformationOfLife1.Create;
  FShipmentBaseConfirms:=TShipmentBaseConfirmList.Create;
  FAdditionalInfo:=TAdditionalInfo1.Create;
end;

destructor TInvoiceInformation.Destroy;
begin
  FreeAndNil(FInvoiceRevisionInfo);
  FreeAndNil(FSeller);
  FreeAndNil(FShippers);
  FreeAndNil(FConsignee);
  FreeAndNil(FPaymentDocuments);
  FreeAndNil(FBuyer);
  FreeAndNil(FAdditionalInformationOfLife1);
  FreeAndNil(FShipmentBaseConfirms);
  FreeAndNil(FAdditionalInfo);
  inherited Destroy;
end;

{ TInvoceDocument }

procedure TInvoceDocument.SetKND(AValue: string);
begin
  if FKND=AValue then Exit;
  FKND:=AValue;
  ModifiedProperty('KND');
end;

procedure TInvoceDocument.SetDocFunction(AValue: string);
begin
  if FDocFunction=AValue then Exit;
  FDocFunction:=AValue;
  ModifiedProperty('DocFunction');
end;

procedure TInvoceDocument.SetDocumentCreator(AValue: string);
begin
  if FDocumentCreator=AValue then Exit;
  FDocumentCreator:=AValue;
  ModifiedProperty('DocumentCreator');
end;

procedure TInvoceDocument.SetDocumentCreatorBase(AValue: string);
begin
  if FDocumentCreatorBase=AValue then Exit;
  FDocumentCreatorBase:=AValue;
  ModifiedProperty('DocumentCreatorBase');
end;

procedure TInvoceDocument.SetDocumentName(AValue: string);
begin
  if FDocumentName=AValue then Exit;
  FDocumentName:=AValue;
  ModifiedProperty('DocumentName');
end;

procedure TInvoceDocument.SetDocumentNameEL(AValue: string);
begin
  if FDocumentNameEL=AValue then Exit;
  FDocumentNameEL:=AValue;
  ModifiedProperty('DocumentNameEL');
end;

procedure TInvoceDocument.SetInformationAvailabilityStructureAdditionalInfo(
  AValue: string);
begin
  if FInformationAvailabilityStructureAdditionalInfo=AValue then Exit;
  FInformationAvailabilityStructureAdditionalInfo:=AValue;
  ModifiedProperty('InformationAvailabilityStructureAdditionalInfo');
end;

procedure TInvoceDocument.SetInvoceDateCreate(AValue: string);
begin
  if FInvoceDateCreate=AValue then Exit;
  FInvoceDateCreate:=AValue;
  ModifiedProperty('InvoceDateCreate');
end;

procedure TInvoceDocument.SetInvoceTimeCreate(AValue: string);
begin
  if FInvoceTimeCreate=AValue then Exit;
  FInvoceTimeCreate:=AValue;
  ModifiedProperty('InvoceTimeCreate');
end;

procedure TInvoceDocument.InternalRegisterPropertys;
begin
  RegisterProperty('KND', 'КНД', 'ОК', 'Код документа по КНД', 7, 7);
  RegisterProperty('DocFunction', 'Функция', 'ОК', 'Функция', 1, 6);
  RegisterProperty('DocumentNameEL', 'ПоФактХЖ', 'Н', 'Наименование документа по факту хозяйственной жизни', 1, 255);
  RegisterProperty('DocumentName', 'НаимДокОпр', 'Н', 'Наименование первичного документа, определенное организацией (согласованное сторонами сделки)', 1, 255);
  RegisterProperty('InvoceDateCreate', 'ДатаИнфПр', 'Н', 'Дата формирования файла обмена счета-фактуры (информации продавца)', 10, 10);
  RegisterProperty('InvoceTimeCreate', 'ВремИнфПр', 'Н', 'Время формирования файла обмена счета-фактуры (информации продавца)', 8, 8);
  RegisterProperty('DocumentCreator', 'НаимЭконСубСост', 'О', 'Наименование экономического субъекта - составителя файла обмена счета-фактуры (информации продавца)', 1, 1000);
  RegisterProperty('DocumentCreatorBase', 'ОснДоверОргСост', 'Н', 'Основание, по которому экономический субъект является составителем файла обмена счета-фактуры (информации продавца)', 1, 120);
  RegisterProperty('InformationAvailabilityStructureAdditionalInfo', 'СоглСтрДопИнф', 'Н', 'Информация о наличии согласованной структуры дополнительных информационных полей', 14, 14);
  RegisterProperty('InvoiceInformation', 'СвСчФакт', 'О', 'Сведения о счете-фактуре (содержание факта хозяйственной жизни 1 - сведения об участниках факта хозяйственной жизни, основаниях и обстоятельствах его проведения)', -1, -1);
  RegisterProperty('InvoiceItems', 'ТаблСчФакт', 'Н', 'Сведения таблицы счета-фактуры (содержание факта хозяйственной жизни 2 - наименование и другая информация об отгруженных товарах (выполненных работах, оказанных услугах), о переданных имущественных правах', -1, -1);
  RegisterProperty('TransferInfo', 'СвПродПер', 'Н', 'Содержание факта хозяйственной жизни 3 - сведения о факте отгрузки товаров (выполнения работ), передачи имущественных прав (о предъявлении оказанных услуг)', -1, -1);
  RegisterProperty('Signers', 'Подписант', 'ОМ', 'Сведения о лице, подписывающем файл обмена счета-фактуры (информации продавца) в электронной форме', -1, -1);
end;

procedure TInvoceDocument.InternalInitChilds;
begin
  FInvoiceInformation:=TInvoiceInformation.Create;
  FInvoiceItems:=TInvoiceItems.Create;
  FTransferInfo:=TTransferInfo.Create;
  FSigners:=TSignerList.Create;
end;

destructor TInvoceDocument.Destroy;
begin
  FreeAndNil(FInvoiceInformation);
  FreeAndNil(FInvoiceItems);
  FreeAndNil(FTransferInfo);
  FreeAndNil(FSigners);
  inherited Destroy;
end;

end.

