import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  final WeekStartFrom? weekStartFrom;

  final Function(DateTime)? onDateChange;

  final Function(List<DateTime>)? onWeekChange;

  final Color? activeBackgroundColor;

  final Color? inactiveBackgroundColor;

  final Color? disabledBackgroundColor;

  final Color? activeTextColor;

  final Color? inactiveTextColor;

  final Color? disabledTextColor;

  final Color? activeNavigatorColor;

  final Color? inactiveNavigatorColor;

  final Color? monthColor;

  final BorderRadiusGeometry? borderRadius;

  final ScrollPhysics? scrollPhysics;

  final bool? showNavigationButtons;

  final String? monthFormat;

  final DateTime minDate;

  final DateTime maxDate;

  final DateTime initialDate;

  final bool showTopNavbar;

  HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor = Colors.grey,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.white,
    this.disabledTextColor = Colors.white,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
    this.borderRadius,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.showNavigationButtons = true,
    this.monthFormat,
    required this.minDate,
    required this.maxDate,
    required this.initialDate,
    this.showTopNavbar = true,
  })  :
        // assert(minDate != null && maxDate != null),
        assert(minDate.isBefore(maxDate)),
        assert(
            minDate.isBefore(initialDate) && (initialDate).isBefore(maxDate)),
        super();

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();

  final int _initialPage = 1;

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initCalender();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalender() {
    final date = widget.initialDate;
    selectedDate = widget.initialDate;

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);

    _getMorePreviousWeeks();

    _getMoreNextWeeks();
  }

  _getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks[currentWeekIndex].first;

    bool canAdd = false;
    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
      // if (widget.minDate != null) {
      if (minusDate.add(const Duration(days: 1)).isAfter(widget.minDate)) {
        canAdd = true;
      }
    }
    if (canAdd == true) {
      listOfWeeks.add(minus7Days.reversed.toList());
    }
    setState(() {});
  }

  _getMoreNextWeeks() {
    List<DateTime> plus7Days = [];
    // DateTime startFrom = currentWeek.last;
    DateTime startFrom = listOfWeeks[currentWeekIndex].last;

    for (int index = 0; index < 7; index++) {
      DateTime addDate = startFrom.add(Duration(days: (index + 1)));
      plus7Days.add(addDate);
    }

    listOfWeeks.insert(0, plus7Days);
    // }
    currentWeekIndex = 1;
    setState(() {});
  }

  _onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  onWeekChange(index) {
    if (currentWeekIndex < index) {
      // on back
    }
    if (currentWeekIndex > index) {
      // on next
    }

    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      _getMorePreviousWeeks();
    }

    if (index == 0) {
      _getMoreNextWeeks();
      carouselController.nextPage();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  // =================

  bool _isReachMinimum(DateTime dateTime) {
    return widget.minDate.add(const Duration(days: -1)).isBefore(dateTime);
  }

  bool _isReachMaximum(DateTime dateTime) {
    return widget.maxDate.add(const Duration(days: 1)).isAfter(dateTime);
  }

  bool _isNextDisabled() {
    DateTime lastDate = listOfWeeks[currentWeekIndex].last;
    // if (widget.maxDate != null) {
    String lastDateFormatted = DateFormat('yyyy/MM/dd').format(lastDate);
    String maxDateFormatted = DateFormat('yyyy/MM/dd').format(widget.maxDate);
    if (lastDateFormatted == maxDateFormatted) return true;
    // }

    bool isAfter =
        // widget.maxDate == null ? false :
        lastDate.isAfter(widget.maxDate);

    return isAfter;
    // return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  bool isBackDisabled() {
    DateTime firstDate = listOfWeeks[currentWeekIndex].first;
    // if (widget.minDate != null) {
    String firstDateFormatted = DateFormat('yyyy/MM/dd').format(firstDate);
    String minDateFormatted = DateFormat('yyyy/MM/dd').format(widget.minDate);
    if (firstDateFormatted == minDateFormatted) return true;
    // }

    bool isBefore =
        // widget.minDate == null ? false :
        firstDate.isBefore(widget.minDate);

    return isBefore;
    // return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek.first) ==
        DateFormat('yyyy').format(today);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              if (widget.showTopNavbar) const SizedBox(height: 12),
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  if (listOfWeeks.isNotEmpty)
                    for (int ind = 0; ind < listOfWeeks.length; ind++)
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int weekIndex = 0;
                                weekIndex < listOfWeeks[ind].length;
                                weekIndex++)
                              Builder(builder: (_) {
                                DateTime currentDate =
                                    listOfWeeks[ind][weekIndex];
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: _isReachMaximum(currentDate) &&
                                            _isReachMinimum(currentDate)
                                        ? () {
                                            _onDateSelect(
                                              listOfWeeks[ind][weekIndex],
                                            );
                                          }
                                        : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: DateFormat('dd-MM-yyyy')
                                                      .format(currentDate) ==
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(selectedDate)
                                              ? widget.activeBackgroundColor ??
                                                  theme.primaryColor
                                              : _isReachMaximum(currentDate) &&
                                                      _isReachMinimum(
                                                          currentDate)
                                                  ? widget.inactiveBackgroundColor ??
                                                      theme.primaryColor
                                                          .withOpacity(.2)
                                                  : widget.disabledBackgroundColor ??
                                                      Colors.grey,
                                          border: Border.all(
                                            color: DateFormat('dd-MM-yyyy')
                                                        .format(currentDate) ==
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(selectedDate)
                                                ? const Color(
                                                    0xFF806DFB)
                                                : Colors
                                                    .white,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${currentDate.day}",
                                              textAlign: TextAlign.center,
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(
                                                color: DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                currentDate) ==
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                selectedDate)
                                                    ? widget.activeTextColor ??
                                                        Colors.grey.shade400
                                                    : _isReachMaximum(
                                                                currentDate) &&
                                                            _isReachMinimum(
                                                                currentDate)
                                                        ? widget.inactiveTextColor ??
                                                            Colors.grey.shade400
                                                                .withOpacity(.2)
                                                        : widget.disabledTextColor ??
                                                            Colors
                                                                .grey.shade400,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              DateFormat(
                                                'EEE',
                                              ).format(
                                                listOfWeeks[ind][weekIndex],
                                              ),
                                              textAlign: TextAlign.center,
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                color: DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                currentDate) ==
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                selectedDate)
                                                    ? widget.activeTextColor ??
                                                        Colors.grey.shade400
                                                    : _isReachMaximum(
                                                                currentDate) &&
                                                            _isReachMinimum(
                                                                currentDate)
                                                        ? widget.inactiveTextColor ??
                                                            Colors.grey.shade400
                                                                .withOpacity(.2)
                                                        : widget.disabledTextColor ??
                                                            Colors
                                                                .grey.shade400,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          ],
                        ),
                      ),
                ],
                options: CarouselOptions(
                  initialPage: _initialPage,
                  scrollPhysics:
                      widget.scrollPhysics ?? const ClampingScrollPhysics(),
                  height: 75,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    onWeekChange(index);
                  },
                ),
              ),
            ],
          );
  }
}
