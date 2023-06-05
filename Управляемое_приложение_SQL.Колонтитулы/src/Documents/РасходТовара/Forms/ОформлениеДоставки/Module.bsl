
&НаСервере
Процедура КОЛ_ПриСозданииНаСервереПосле(Отказ, СтандартнаяОбработка)
	ФорматированнаяСтрокаМассив = Новый Массив;
	ФорматированнаяСтрокаМассив.Добавить(Новый ФорматированнаяСтрока(Документ.Организация.Наименование, Новый Шрифт("Courier", 20, Истина)));
	ФорматированнаяСтрокаМассив.Добавить(Символы.ПС);
	ФорматированнаяСтрокаМассив.Добавить(Формат(Год(ТекущаяДата()), "ЧГ=") + " год");
	
	ТабличныйДокумент.ВерхнийКолонтитул.ТекстВЦентре = Новый ФорматированнаяСтрока(ФорматированнаяСтрокаМассив);
	ТабличныйДокумент.ВерхнийКолонтитул.ТекстСлева = Новый ФорматированнаяСтрока(БиблиотекаКартинок.КОЛ_Логотип);
	ТабличныйДокумент.ВерхнийКолонтитул.ВертикальноеПоложение = ВертикальноеПоложение.Центр;
	ТабличныйДокумент.ВерхнийКолонтитул.Выводить = Истина;
КонецПроцедуры

&НаКлиенте
Процедура КОЛ_ПриОткрытииПосле(Отказ)
	ТабличныйДокумент.РазмерКолонтитулаСверху = ТабличныйДокумент.ОпределитьРазмерКолонтитулаСверху();
	ТабличныйДокумент.ПолеСверху = ТабличныйДокумент.ОпределитьРазмерКолонтитулаСверху() + ТабличныйДокумент.ПолучитьРазмерПоляПринтераСверху();
КонецПроцедуры
