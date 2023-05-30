import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/list_news_model.dart';

class ListInternasional extends StatefulWidget {
  const ListInternasional({Key? key}) : super(key: key);

  @override
  State<ListInternasional> createState() => _ListInternasionalState();
}

class _ListInternasionalState extends State<ListInternasional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("REPUBLIKA INTERNASIONAL"),
      ),
      body: _buildListInternasionalBody(),
    );
  }

  Widget _buildListInternasionalBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadinternasional(),
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

  Widget _buildItemterbaru(Posts ListInternasional) {
    return InkWell(
      onTap: () {},
      // => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PageDetailCharacter(
      //       idCharacter: characterData.id!,
      //       name: characterData.name!,
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
              child: Image.network(ListInternasional.thumbnail!),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ListInternasional.title!,
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
