import 'dart:collection';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_voyage_new/system/showdata.dart';
import 'package:heart_voyage_new/system/userdata.dart';
import 'package:heart_voyage_new/system/userdata_func.dart';

import 'package:table_calendar/table_calendar.dart';


import '../tabs.dart';
import './utils.dart';
import 'common_widgets.dart';

class sign extends StatefulWidget {
  @override
  _signState createState() => _signState();
}

class _signState extends State<sign> {
  int _now = DateTime.now().millisecondsSinceEpoch;
  final _last_time_signed_box = GetStorage();
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late int _value;
  late LinkedHashMap myEvents = returnMyEvents();

  //bool _isTodaysigned = basicData['isTodaySigned'];

  returnMyEvents() {
    var _myEventSource = Map.fromIterable(List.generate(120, (index) => 1),
        key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item),
        value: (item) => List.generate(item % 1, (index) => Event('本日未签到~')))
      ..addAll({
        kToday: [
          basicData['isTodaysigned']
              ? Event('今日已签到，获得10点成长值~')
              : Event('今日未签到，请点击下方按钮签到打卡~'),
        ],
      });
    return LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_myEventSource);
  }

  @override
  void initState() {

    super.initState();


    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    myEvents = returnMyEvents();
    int _rand = signPhotoPath.length - 1;
     _value= Random().nextInt(_rand);
     print(_value);
     print(signPhotoPath[_value]);
     print(signContents[_value]);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    if (day.isAfter(DateTime.now()))
      return [];
    else
      return myEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),

      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("每日打卡"),
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh)),
            ],
          )),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar<Event>(
              locale: 'zh_CN',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: true,
              ),
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
                child: _last_time_signed_box.read('last_time_signed') == null || _now - _last_time_signed_box.read('last_time_signed') > 24 * 60 * 60 * 1000
                    ? ElevatedButton(
                        child: Text("点这里进行签到~"),
                        onPressed: () {
                          setState(() {
                            basicData['isTodaysigned'] = true;
                            basicData['score'] += 10;
                            final _last_time_signed_box = GetStorage();
                            var _now = DateTime.now();
                            int _nowTime = _now.millisecondsSinceEpoch;
                            _last_time_signed_box.write('last_time_signed',_nowTime);
                            saveBasicData();
                          });
                          Get.defaultDialog(
                              textConfirm: "前往主页面",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                Get.offAll(tabs());
                              },
                              title: "每天学点心理学",
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height * 0.5,
                                child: ListView(
                                  children: [
                                    Container(
                                      child: Text(getDate()),
                                      alignment: Alignment.topRight,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Image.asset(signPhotoPath[_value]),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(

                                      child: Text(signContents[_value]),
                                      width: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                              )
                              ;
                        },
                      )
                    : ElevatedButton(
                        child: Text("今天已签到，点此返回~"),
                        onPressed: () {
                          setState(() {
                            final _last_time_signed_box = GetStorage();
                            var _now = DateTime.now();
                            int _nowTime = _now.millisecondsSinceEpoch;
                            _last_time_signed_box.write('last_time_signed',_nowTime);
                            Get.offAll(tabs());
                          });
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
