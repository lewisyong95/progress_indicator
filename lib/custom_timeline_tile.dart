//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatelessWidget {
  final int totalDayNum = 10;
  final int totalPastDayNum = 5;
  final double startPoint = 0.3;
  final double middlePoint = 0.5;
  final double endPoint = 0.7;
  final double thickness = 6.0;
  final completeColor = Colors.green;
  final toDoColor = Colors.grey;
  final noMoreQuote = "You can do it!";
  final quoteList = [
    "All our dreams can come true, if we have the courage to pursue them.",
    "The secret of getting ahead is getting started.",
    "I've missed more than 9,000 shots in my career.",
    "Don't limit yourself.",
    "The best time to plant a tree was 20 years ago.",
    "All our dreams can come true, if we have the courage to pursue them.",
    "The secret of getting ahead is getting started.",
    "I've missed more than 9,000 shots in my career.",
    "Don't limit yourself.",
    "The best time to plant a tree was 20 years ago.",
    "All our dreams can come true, if we have the courage to pursue them.",
    "The secret of getting ahead is getting started.",
    "I've missed more than 9,000 shots in my career.",
    "Don't limit yourself.",
    "The best time to plant a tree was 20 years ago.",
    "All our dreams can come true, if we have the courage to pursue them.",
    "The secret of getting ahead is getting started.",
    "I've missed more than 9,000 shots in my career.",
    "Don't limit yourself.",
    "The best time to plant a tree was 20 years ago.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          this.createFinishTile(totalDayNum),
          for (int i = totalDayNum - 1; i > 0; i--)
            this.createTimelineTile(i, 'This is a setence'),
          this.createStartTile(),
        ],
      ),
    );
  }

  Widget createTimelineTile(int index, String text) => Column(children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: index % 2 == 0 ? startPoint : endPoint,
          beforeLineStyle: LineStyle(
            color: index < totalPastDayNum ? completeColor : toDoColor,
            thickness: thickness,
          ),
          afterLineStyle: LineStyle(
            color: index <= totalPastDayNum ? completeColor : toDoColor,
            thickness: thickness,
          ),
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: index <= totalPastDayNum ? completeColor : toDoColor,
          ),
          startChild: Container(
              alignment: AlignmentDirectional.centerEnd,
              child: index % 2 == 0
                  ? showText('Day $index',
                      index <= totalPastDayNum ? completeColor : toDoColor)
                  : showText(quoteList[index],
                      index <= totalPastDayNum ? completeColor : toDoColor)),
          endChild: Container(
            alignment: AlignmentDirectional.centerStart,
            child: index % 2 == 0
                ? showText(quoteList[index],
                    index <= totalPastDayNum ? completeColor : toDoColor)
                : showText('Day $index',
                    index <= totalPastDayNum ? completeColor : toDoColor),
          ),
        ),
        TimelineDivider(
          begin: startPoint,
          end: endPoint,
          thickness: thickness,
          color: index <= totalPastDayNum ? completeColor : toDoColor,
        ),
      ]);

  Widget createFinishTile(int total) => Column(children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: middlePoint,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: total <= totalPastDayNum ? completeColor : toDoColor,
          ),
          beforeLineStyle: LineStyle(
            color: total <= totalPastDayNum ? completeColor : toDoColor,
            thickness: thickness,
          ),
          startChild: Container(
              alignment: AlignmentDirectional.centerEnd,
              child: showText('Congratulation!',
                  total <= totalPastDayNum ? completeColor : toDoColor)),
          endChild: Container(
            alignment: AlignmentDirectional.centerStart,
            child: showText('Day $total',
                total <= totalPastDayNum ? completeColor : toDoColor),
          ),
        ),
        TimelineDivider(
          begin: total % 2 == 0 ? middlePoint : startPoint,
          end: total % 2 == 0 ? endPoint : middlePoint,
          thickness: thickness,
          color: total <= totalPastDayNum ? completeColor : toDoColor,
        ),
      ]);

  Widget createStartTile() => Column(children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: startPoint,
          isLast: true,
          beforeLineStyle: LineStyle(
            color: completeColor,
            thickness: thickness,
          ),
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: completeColor,
          ),
          endChild: Container(
            alignment: AlignmentDirectional.centerStart,
            child: showText('Start', completeColor),
          ),
        ),
      ]);

  Widget showText(String text, color) => Card(
      //color: completeColor,
      child: Container(
          constraints: BoxConstraints(maxWidth: 200),
          padding: EdgeInsets.all(8.0),
          child: Text(
            text.isNotEmpty ? text : noMoreQuote,
            textAlign: TextAlign.center,
          )));
}
