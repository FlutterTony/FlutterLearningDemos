import 'package:flutter/material.dart';

class Navigator2Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Navigator2DemoState();
}

class _Navigator2DemoState extends State<Navigator2Demo> {
  Book _selectedBook;

  List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        // 导航页面栈
        pages: [
          // 页面1
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              // 选中书时，重构BooksApp根元件，重写导航页面栈
              onTapped: _handleBookTapped,
            ),
          ),
          // 页面2
          if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    print('点击页面');
    setState(() {
      _selectedBook = book;
    });
  }
}


class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

// Page子类
class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({this.book}) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图书列表'),),
      body: ListView(
        children: [
          for (var book in books)
            ...[ListTile(
              leading: Icon(Icons.book,color: Colors.blue,),
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            ),
              Divider()]
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({
    @required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图书详情'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 条件解构
            // if (book != null) ...[
            //   Text(book.title, style: Theme.of(context).textTheme.headline6),
            //   Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            // ],
            // Divider(),
            // 另一种写法
            ListTile(
              leading: Icon(Icons.book,color: Colors.blue,),
              title: Text(book.title, style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(book.author, style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}