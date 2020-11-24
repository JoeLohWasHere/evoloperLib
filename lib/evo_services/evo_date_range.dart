class EvoDateRange{
  final String dateRange;
  final Map<String, String> customDateRangeMap;
  DateTime outputFromDate, outputToDate;
  List<String> _dateRangeList = [];
  DateTime _from = DateTime.now(), _to = DateTime.now(), _now = DateTime.now();

  EvoDateRange({this.dateRange, this.customDateRangeMap});

  void _getDate(){
    if(customDateRangeMap!={}||customDateRangeMap!=null){
      Map<String, String> _fixedDate = {
        'customdate' : 'Define Custom Date',
        'today' : 'Today',
        'yesterday' : 'Yesterday',
        'past7day' : 'Last 7 Days',
        'past30day' : 'Last 30 Days',
        'thisweek' : 'This Week',
        'thismth' : 'This Month',
        'thisqtr' : 'This Quarter',
        'thisyear' : 'This Year',
        'pastweek' : 'Past Week',
        'pastmth' : 'Past Month',
        'past3mth' : 'Past 3 Months',
        'past6mth' : 'Past 6 Months',
        'pastqtr' : 'Past Quarter',
        'pastyear' : 'Past Year'
      };

      _fixedDate.forEach((_id, _name) {
        _dateRangeList.add(_name);
      });
    }else{
      customDateRangeMap.forEach((_id, _name) {
        _dateRangeList.add(_name);
      });
    }
  }

  void getToday(){
    _from = DateTime.now();
    _to = DateTime.now();
    _setOutput();
  }

  void getYesterday(){
    _from = DateTime(_now.year, _now.month, _now.day-1);
    _to = DateTime(_now.year, _now.month, _now.day-1);
    _setOutput();
  }

  void getLast7Days(){
    _from = DateTime(_now.year, _now.month, _now.day-6);
    _setOutput();
  }

  void getLast30Days(){
    _from = DateTime(_now.year, _now.month, _now.day-29);
    _setOutput();
  }

  void getThisWeek(){
    _from = _now.subtract(Duration(days: _now.weekday - 1));
    _setOutput();
  }

  void getThisMonth(){
    _from = DateTime(_now.year, _now.month, 1);
    _setOutput();
  }

  void getThisQuarter(){
    if(_now.month<=3){
      _from = DateTime(_now.year, 1, 1);
    }else if(_now.month>=4&&_now.month<=6){
      _from = DateTime(_now.year, 4, 1);
    }else if(_now.month>=7&&_now.month<=9){
      _from = DateTime(_now.year, 7, 1);
    }else if(_now.month>=10){
      _from = DateTime(_now.year, 10, 1);
    }
    _setOutput();
  }

  void getThisYear(){
    _from = DateTime(_now.year, 1, 1);
    _setOutput();
  }

  void getPastWeek(){
    _from = DateTime(_now.year, _now.month, _now.day-7);
    _from = _from.subtract(Duration(days: _from.weekday-1));
    _to = DateTime(_now.year, _now.month, _now.day-7);
    _to = _to.subtract(Duration(days: _to.weekday-7));
    _setOutput();
  }

  void getPastMonth(){
    _from = DateTime(_now.year, _now.month-1, 1);
    _to = DateTime(_now.year, _now.month, 0);
    _setOutput();
  }

  void getPast3Months(){
    _from = DateTime(_now.year, _now.month-3, 1);
    _to = DateTime(_now.year, _now.month, 0);
    _setOutput();
  }

  void getPast6Months(){
    _from = DateTime(_now.year, _now.month-6, 1);
    _to = DateTime(_now.year, _now.month, 0);
    _setOutput();
  }

  void getPastQuarter(){
    _to = DateTime(_now.year, _now.month-1, 0);
    if(_to.month<=3){
      _from = DateTime(_to.year, 1, 1);
    }else if(_to.month>=4&&_now.month<=6){
      _from = DateTime(_to.year, 4, 1);
    }else if(_to.month>=7&&_now.month<=9){
      _from = DateTime(_to.year, 7, 1);
    }else if(_to.month>=10){
      _from = DateTime(_to.year, 10, 1);
    }
    _setOutput();
  }

  void getPastYear(){
    _from = DateTime(_now.year-1, 1, 1);
    _to = DateTime(_now.year-1, 12, 31);
    _setOutput();
  }

  void _setOutput(){
    outputFromDate = _from;
    outputToDate = _to;
  }

  void getDatesFromList(){
    _getDate();

    //Today
    if (dateRange == _dateRangeList[1]){
     getToday();
    }

    //Yesterday
    if (dateRange == _dateRangeList[2]){
      getYesterday();
    }

    //Last 7 Days
    if (dateRange == _dateRangeList[3]){
      getLast7Days();
    }

    //Last 30 Days
    if (dateRange == _dateRangeList[4]){
      getLast30Days();
    }

    //This Week
    if (dateRange == _dateRangeList[5]){
      getThisWeek();
    }

    //This Month
    if (dateRange == _dateRangeList[6]){
      getThisMonth();
    }

    //This Quarter
    if (dateRange == _dateRangeList[7]){
      getThisQuarter();
    }

    //This Year
    if (dateRange == _dateRangeList[8]){
      getThisYear();
    }

    //Past Week
    if (dateRange == _dateRangeList[9]){
      getPastWeek();
    }

    //Past Month
    if (dateRange == _dateRangeList[10]){
      getPastMonth();
    }

    //Past 3 Months
    if (dateRange == _dateRangeList[11]){
      getPast3Months();
    }

    //Past 6 Months
    if (dateRange == _dateRangeList[12]){
      getPast6Months();
    }

    //Past Quarter
    if (dateRange == _dateRangeList[13]){
      getPastQuarter();
    }

    //Past Year
    if (dateRange == _dateRangeList[14]){
     getPastYear();
    }
  }
}