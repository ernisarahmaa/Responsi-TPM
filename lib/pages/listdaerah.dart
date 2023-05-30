import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/list_news_model.dart';

class ListDaerah extends StatefulWidget {
  const ListDaerah({Key? key}) : super(key: key);

  @override
  State<ListDaerah> createState() => _ListDaerahState();
}

class _ListDaerahState extends State<ListDaerah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("REPUBLIKA DAERAH"),
      ),
      body: _buildListDaerahBody(),
    );
  }

  Widget _buildListDaerahBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loaddaerah(),
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

  Widget _buildItemterbaru(Posts ListDaerah) {
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
              child: Image.network(ListDaerah.thumbnail!),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ListDaerah.title!,
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
