import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/list_news_model.dart';
import 'package:responsi/pages/detail.dart';

class ListTerbaru extends StatefulWidget {
  const ListTerbaru({Key? key}) : super(key: key);

  @override
  State<ListTerbaru> createState() => _ListTerbaruState();
}

class _ListTerbaruState extends State<ListTerbaru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("REPUBLIKA TERBARU"),
      ),
      body: _buildListTerbaruBody(),
    );
  }

  Widget _buildListTerbaruBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadterbaru(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(listNewsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Text("ERROR");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListNewsModel data) {
    return ListView.builder(
      itemCount: data.data!.posts!.length,
      itemBuilder: (context, index) {
        return _buildItemterbaru(data.data!.posts![index]);
      },
    );
  }

  Widget _buildItemterbaru(Posts listTerbaru) {
    return InkWell(
      onTap: () {},
      // => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PageDetail(
      //       title: listTerbaru.title!,
      //     )
      //   )
      // ),
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: 300,
              child: Image.network(listTerbaru.thumbnail!),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listTerbaru.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
