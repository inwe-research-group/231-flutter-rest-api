import 'package:flutter/material.dart';
import 'package:flutter_rest_api1/servicios/apiservice.dart';
import 'package:flutter_rest_api1/modelos/reportes.dart';

class MyHomePageReportes extends StatefulWidget {
  const MyHomePageReportes({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePageReportes> createState() => _MyHomePageReportesStated();
}

class _MyHomePageReportesStated extends State<MyHomePageReportes> {
  List<Reportes>? reportes;
  var isLoaded = false;

  getData() async {
    reportes = await ApiService.fetchReportes();
    if (reportes != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      throw Exception('Fallo la carga de reportes desde la API');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Reportes'),
        ),
        body: Visibility(
            visible: isLoaded,
            child: ListView.builder(
                itemCount: reportes?.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reportes![index].reporte_name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              reportes![index].reporte_descripcion,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                      ],
                    ),
                  );
                })));
  }
}
