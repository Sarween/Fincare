import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_limit_model.dart';
export 'set_limit_model.dart';

import 'dart:async';

import 'package:mysql1/mysql1.dart';

class SetLimitWidget extends StatefulWidget {
  const SetLimitWidget({Key? key}) : super(key: key);

  @override
  _SetLimitWidgetState createState() => _SetLimitWidgetState();
}

class _SetLimitWidgetState extends State<SetLimitWidget> {
  late SetLimitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _dataToInsert = '';
  String? dropDownValue;

  DateTimeRange? calendarday;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetLimitModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF483E95),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Set Limit',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100.0,
                  height: 176.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: Image.network(
                          'https://media.licdn.com/dms/image/C4E03AQETVq6FT_-hcA/profile-displayphoto-shrink_800_800/0/1645017926676?e=1698883200&v=beta&t=_bKH_SlhnIU8kHG_k13p7eiic9CaMrgjjBoN_607V1I',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        'Dylan',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    autofocus: true,
                    obscureText: false,
                    onChanged: (value) {
                      setState(() {
                        _dataToInsert = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Amount (RM)',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: [
                    'Entertainment',
                    'Food',
                    'Academics',
                    'Clothings',
                    'Others'
                  ],
                  onChanged: (val) => setState(() {
                    _model.dropDownValue = val;
                    dropDownValue = val;
                  }),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                  hintText: 'Select Category',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: Color(0xFF483E95),
                  elevation: 2.0,
                  borderColor: Color(0xFF483E95),
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                FlutterFlowCalendar(
                  color: Color(0xFF483E95),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: false,
                  weekStartsMonday: true,
                  rowHeight: 64.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() {
                      _model.calendarSelectedDay = newSelectedDate;
                      calendarday = newSelectedDate;
                    });
                  },
                  titleStyle:
                      FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF483E95),
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                  inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final connection = await createDatabaseConnection();

                    // Insert the data into the database
                    await insertData(
                        connection, _dataToInsert, dropDownValue, calendarday);

                    // Close the connection
                    await connection.close();

                    context.pushNamed('Financial_Tracker');
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF483E95),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> insertData(MySqlConnection connection, String dataToInsert,
      String? dropDownValue, DateTimeRange? calendarday) async {
    try {
      final results = await connection.query(
        'INSERT INTO set_limit (amount,category,startdate,enddate) VALUES (?,?,?,?)',
        [
          _model.textController.text,
          _model.dropDownValue,
          _model.calendarSelectedDay?.start.toUtc(),
          _model.calendarSelectedDay?.end.toUtc()
        ],
      );
    } catch (e) {
      print('Error inserting data: $e');
    }
  }

  Future<MySqlConnection> createDatabaseConnection() async {
    final settings = ConnectionSettings(
      host: '159.138.82.111',
      port: 3306,
      user: 'root',
      password: '@Chngjunbin0322',
      db: 'fincare',
    );

    final connection = await MySqlConnection.connect(settings);
    return connection;
  }
}
