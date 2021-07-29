import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Components/ListaPendientes.dart';
import 'Components/ListaRealizados.dart';

class Pendientes extends StatefulWidget {
  @override
  _PendientesState createState() => _PendientesState();
}

class _PendientesState extends State<Pendientes> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  tabs: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.only(top: 35),
                      child: new Text(
                        'CREADOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.only(top: 35),
                      child: new Text(
                        'EN REPARTO',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.only(top: 35),
                      child: new Text(
                        'FINALIZADOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                  unselectedLabelColor: const Color(0xffacb3bf),
                  indicatorColor: kPrimaryColor,
                  labelColor: kPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  indicatorPadding: EdgeInsets.all(10),
                  isScrollable: false,
                  controller: _tabController,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-300,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      child: EnviosPendientes(),
                    ),
                    Container(
                      child: EnviosRealizados(),
                    ),
                    Container(
                      child: EnviosRealizados(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }



}
