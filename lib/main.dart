
import 'package:flutter/material.dart';

void main() {
  runApp(PataAo254App());
}

class PataAo254App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PATA AO 254',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> searchMap = {
    'nairobi': (context) => NairobiPlacesPage(),
    'mombasa': (context) => MombasaPlacesPage(),
    'nakuru': (context) => NakuruPlacesPage(),
    'eastleigh': (context) => HouseListPage(cityName: 'Eastleigh'),
    'embakasi east': (context) => HouseListPage(cityName: 'Embakasi East'),
    'highrise': (context) => HouseListPage(cityName: 'Highrise'),
    'karen': (context) => HouseListPage(cityName: 'Karen'),
    'kasarani': (context) => HouseListPage(cityName: 'Kasarani'),
    'kawangware': (context) => HouseListPage(cityName: 'Kawangware'),
    'kibra': (context) => HouseListPage(cityName: 'Kibra'),
    'langata': (context) => HouseListPage(cityName: 'Langata'),
    'ngara': (context) => HouseListPage(cityName: 'Ngara'),
    'roysambu': (context) => HouseListPage(cityName: 'Roysambu'),
    'umoja': (context) => HouseListPage(cityName: 'Umoja'),
    'bamburi': (context) => HouseListPage(cityName: 'Bamburi'),
    'bombolulu': (context) => HouseListPage(cityName: 'Bombolulu'),
    'mwisho wa lami': (context) => HouseListPage(cityName: 'Mwisho Wa Lami'),
    'buxton': (context) => HouseListPage(cityName: 'Buxton'),
    'kisahuni': (context) => HouseListPage(cityName: 'Kisahuni'),
    'kongowea': (context) => HouseListPage(cityName: 'Kongowea'),
    'lights': (context) => HouseListPage(cityName: 'Lights'),
    'makupa': (context) => HouseListPage(cityName: 'Makupa'),
    'mwembe tayari': (context) => HouseListPage(cityName: 'Mwembe Tayari'),
    'nyali': (context) => HouseListPage(cityName: 'Nyali'),
    'bridge': (context) => HouseListPage(cityName: 'Bridge'),
    'kaptembwa': (context) => HouseListPage(cityName: 'Kaptembwa'),
    'landon': (context) => HouseListPage(cityName: 'Landon'),
    'lanet': (context) => HouseListPage(cityName: 'Lanet'),
    'mercy njeri': (context) => HouseListPage(cityName: 'Mercy Njeri'),
    'pipeline': (context) => HouseListPage(cityName: 'Pipeline'),
    'rvist': (context) => HouseListPage(cityName: 'RVIST'),
    'railways': (context) => HouseListPage(cityName: 'Railways'),
    'shabee': (context) => HouseListPage(cityName: 'Shabee'),
    'upperhill': (context) => HouseListPage(cityName: 'UpperHill'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PATA AO 254'),
        backgroundColor: Colors.lightBlue,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Home') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else if (value == 'About') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              } else if (value == 'Contact Us') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()),
                );
              } else if (value == 'Admin') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Home', 'About', 'Contact Us', 'Admin']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: 
      
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Area...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (query) {
                final normalizedQuery = query.toLowerCase().trim();
                if (searchMap.containsKey(normalizedQuery)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: searchMap[normalizedQuery]!),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Not Found'),
                        content: Text('The area "$query" is not available.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CitySelectionPage()),
              );
            },
            child: Text('Find Rental Houses'),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text('PATA AO 254 is a rental housing app connecting you to properties in Kenya. Contact Admin for more information.'),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text('For inquiries, please contact us at info@pataao254.com/call:+254700480098'),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text('WhatsApp/Call/Text Admin:+254700480098/+254789341901'),
      ),
    );
  }
}

class CitySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PATA AO 254'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
          CityCard(cityName: 'Nairobi'),
          CityCard(cityName: 'Mombasa'),
          CityCard(cityName: 'Nakuru'),
        ],
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String cityName;

  CityCard({required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(cityName),
        onTap: () {
          if (cityName == 'Nairobi') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NairobiPlacesPage()),
            );
          } else if (cityName == 'Mombasa') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MombasaPlacesPage()),
            );
          } else if (cityName == 'Nakuru') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NakuruPlacesPage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HouseListPage(cityName: cityName)),
            );
          }
        },
      ),
    );
  }
}

class NairobiPlacesPage extends StatelessWidget {
  final List<String> nairobiPlaces = [
    'Eastleigh',
    'Embakasi East',
    'Highrise',
    'Karen',
    'Kasarani',
    'Kawangware',
    'Kibra',
    'Langata',
    'Ngara',
    'Roysambu',
    'Umoja'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nairobi Places'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: nairobiPlaces.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(nairobiPlaces[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseListPage(cityName: nairobiPlaces[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MombasaPlacesPage extends StatelessWidget {
  final List<String> mombasaPlaces = [
    'Bamburi',
    'Bombolulu',
    'Mwisho Wa Lami',
    'Buxton',
    'Kisahuni',
    'Kongowea',
    'Lights',
    'Makupa',
    'Mwembe Tayari',
    'Nyali'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mombasa Places'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: mombasaPlaces.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(mombasaPlaces[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseListPage(cityName: mombasaPlaces[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NakuruPlacesPage extends StatelessWidget {
  final List<String> nakuruPlaces = [
    'Bridge',
    'Kaptembwa',
    'Landon',
    'Lanet',
    'Mercy Njeri',
    'Pipeline',
    'RVIST',
    'Railways',
    'Shabee',
    'UpperHill'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nakuru Places'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: nakuruPlaces.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(nakuruPlaces[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseListPage(cityName: nakuruPlaces[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HouseListPage extends StatelessWidget {
  final String cityName;

  HouseListPage({required this.cityName});

  @override
  Widget build(BuildContext context) {
    // Placeholder data
    final List<Map<String, String>> houses = [
      {'title': '2 Bedroom Apartment'},
      {'title': '3 Bedroom Maisonette'},
      {'title': '1 Bedroom Bedsitter'},
      {'title': 'Singleroom'},
      {'title': 'Bedsitter'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('PATA AO 254'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: houses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(houses[index]['title']!),
              onTap: houses[index]['title'] == 'Bedsitter' || houses[index]['title'] == 'Singleroom'
                  ? () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Contact Information'),
                            content: Text('Call : +254789341901'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  : houses[index]['title'] == '1 Bedroom Bedsitter' || houses[index]['title'] == '2 Bedroom Apartment'
                      ? () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                               
                                title: Text(houses[index]['title']!),
                                content: Text(
                                    'For inquiries, please contact us at +254789341902'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(houses[index]['title']!),
                                content: Text(
                                    'For details, reach out to our office at +254789341903'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
            ),
          );
        },
      ),
    );
  }
}
