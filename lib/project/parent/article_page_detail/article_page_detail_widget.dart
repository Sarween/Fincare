import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'article_page_detail_model.dart';
export 'article_page_detail_model.dart';

class ArticlePageDetailWidget extends StatefulWidget {
  const ArticlePageDetailWidget({Key? key}) : super(key: key);

  @override
  _ArticlePageDetailWidgetState createState() =>
      _ArticlePageDetailWidgetState();
}

class _ArticlePageDetailWidgetState extends State<ArticlePageDetailWidget> {
  late ArticlePageDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlePageDetailModel());
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
            'Learn to Plan Your Budget',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 220.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF483E95),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxidWRnZXR8ZW58MHx8fHwxNjkzNzUyMjUxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: 120.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'by Jackson Hewiit',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                'Budgeting is a cornerstone of financial responsibility, offering you the roadmap to manage your finances efficiently. It begins with a comprehensive assessment of your financial situation, where you gather all your income sources, expenses, bills, and financial records. This holistic view enables you to set clear and realistic financial goals, which could range from paying off debts to saving for a dream vacation or building an emergency fund. These goals give purpose and direction to your budgeting efforts.\n\nWith your financial objectives in place, the next step is to create a budget. Start by cataloging all your monthly expenses, distinguishing between fixed costs like rent, utilities, and loan payments, and variable expenses such as groceries, dining out, and entertainment. It\'s imperative to differentiate between needs and wants, prioritizing the former in your budget.\n\nTo stay on course with your budget, diligent tracking of your expenses is vital. Many people find it useful to use budgeting apps or tools to monitor their spending habits closely. Additionally, working towards the establishment of an emergency fund is essential, as it acts as a financial safety net for unexpected situations, offering peace of mind and financial stability.\n\nDiscipline plays a pivotal role in budgeting success. Avoiding impulsive purchases and making informed spending decisions are crucial aspects of adhering to your budget. Periodically reviewing and adjusting your budget is equally important, especially as your financial situation evolves over time. As you practice and commit to budgeting, you\'ll find it to be a powerful tool that not only ensures financial stability but also helps you achieve your financial aspirations.',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
