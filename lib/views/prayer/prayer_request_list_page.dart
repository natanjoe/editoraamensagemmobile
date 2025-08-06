import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PrayerRequestsListPage extends StatefulWidget {
  const PrayerRequestsListPage({super.key});

  @override
  State<PrayerRequestsListPage> createState() => _PrayerRequestsListPageState();
}

class _PrayerRequestsListPageState extends State<PrayerRequestsListPage> {
  List<ParseObject> prayerRequests = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrayerRequests();
  }

  Future<void> fetchPrayerRequests() async {
    setState(() {
      isLoading = true;
    });

    final query = QueryBuilder<ParseObject>(ParseObject('PrayerRequests'))
      ..orderByDescending('createdAt');

    final ParseResponse apiResponse = await query.query();

    if (apiResponse.success && apiResponse.results != null) {
      setState(() {
        prayerRequests = apiResponse.results as List<ParseObject>;
      });
    } else {
      setState(() {
        prayerRequests = [];
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day.toString().padLeft(2, '0')}/"
           "${date.month.toString().padLeft(2, '0')}/"
           "${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos de Oração'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchPrayerRequests,
              child: prayerRequests.isEmpty
                  ? const Center(child: Text('Nenhum pedido encontrado.'))
                  : ListView.builder(
                      itemCount: prayerRequests.length,
                      itemBuilder: (context, index) {
                        final request = prayerRequests[index];
                        final name = request.get<String>('name') ?? '';
                        final email = request.get<String>('email') ?? '';
                        final city = request.get<String>('city') ?? '';
                        final whatsapp = request.get<String>('whatsapp') ?? '';
                        final description =
                            request.get<String>('description') ?? '';
                        final createdAt = request.createdAt;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: ListTile(
                            title: Text(
                              "$name - $city",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(description),
                                const SizedBox(height: 5),
                                Text(
                                  "Data: ${formatDate(createdAt)}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "Email: $email",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "WhatsApp: $whatsapp",
                                  style: const TextStyle(fontSize: 12),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}
