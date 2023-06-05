&НаСервере
Процедура Заполнить(Контрагент)
	
	Запрос = Новый Запрос("ВЫБРАТЬ
	                      |	ВзаиморасчетыОстатки.Контрагент КАК Контрагент,
	                      |	ВзаиморасчетыОстатки.Валюта КАК Валюта,
	                      |	ВзаиморасчетыОстатки.СуммаОстаток КАК СуммаОстаток
	                      |ИЗ
	                      |	РегистрНакопления.Взаиморасчеты.Остатки(&ТекущаяДата, Контрагент = &Контрагент) КАК ВзаиморасчетыОстатки
	                      |АВТОУПОРЯДОЧИВАНИЕ");
	
	Запрос.УстановитьПараметр("ТекущаяДата", ТекущаяДатаСеанса());
	Запрос.УстановитьПараметр("Контрагент", Контрагент);
	
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл
		НоваяСтрока = ТаблицаОстатков.Добавить();
		НоваяСтрока.Контрагент = Выборка.Контрагент;
		НоваяСтрока.Валюта = Выборка.Валюта;
		Если Выборка.СуммаОстаток > 0 Тогда
			НоваяСтрока.НашДолг = Выборка.СуммаОстаток;
		Иначе
			НоваяСтрока.ДолгНам = Выборка.СуммаОстаток * -1;
		КонецЕсли;	
	КонецЦикла
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Контрагент = Параметры.Контрагент;
	Заполнить(Контрагент);
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаОстатковВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	ПоказатьЗначение( ,ТаблицаОстатков.НайтиПоИдентификатору(ВыбраннаяСтрока).Контрагент);
	СтандартнаяОбработка = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьВыполнить()
	ТаблицаОстатков.Очистить();
	Заполнить(Контрагент);
КонецПроцедуры
