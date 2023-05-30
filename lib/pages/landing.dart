import 'package:flutter/material.dart';
import 'package:responsi/pages/listdaerah.dart';
import 'package:responsi/pages/listinternasional.dart';
import 'package:responsi/pages/listislam.dart';
import 'package:responsi/pages/listterbaru.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/logo.webp',
              height: 200,
              width: 250,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 350)),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 42,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListTerbaru(),
                            ),
                          );
                        },
                        color: Colors.teal,
                        child: const Text(
                          'TERBARU',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        minWidth: 150,
                        height: 42,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListInternasional(),
                            ),
                          );
                        },
                        color: Colors.teal,
                        child: const Text(
                          'INTERNASIONAL',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 150,
                        height: 42,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListDaerah(),
                            ),
                          );
                        },
                        color: Colors.teal,
                        child: const Text(
                          'DAERAH',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        minWidth: 150,
                        height: 42,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListIslam(),
                            ),
                          );
                        },
                        color: Colors.teal,
                        child: const Text(
                          'ISLAM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
