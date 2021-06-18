# flutter_extensions

My library of Dart extensions for Flutter.

## Content

This library contains some extensions on the following classes:

- Widget
- String
- List (Generic)
- Iterable (Generic)
- List (Widget)

### Widget examples

Most of the extensions are written for the Widget class to make code much tidier in a lot of cases.
  
For example:
```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Title 1'),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Title 2'),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Title 3'),
                )
            ),
          ],
        ),
      ),
    );
  }
```
Could become:
```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: [
              Text('Title 1').xPadAll(8).xExpanded(),
              Text('Title 2').xPadAll(8).xExpanded(),
              Text('Title 3').xPadAll(8).xExpanded(),
            ].xColumn()
      ),
    );
  }
```
(In the above example I would tend not to use the Column extension as a personal preference)

I use the extensions mostly for wrapping widgets in Flexible, Expanded and the various Padding widgets which eliminate the need to write "EdgeInsets...", and other such class names, over and over again.

I also like to use the various Transform wrappers for translation, rotation and scale transforms.

### Non-Widget examples

There are many other extensions and the library is constantly growing. `getRandom()` on Iterable is a particularly useful one.

```
List<String> myList = ['a', 'b', 'c', 'd', 'e', 'f'];

// Before
String item = myList[Random().nextInt(myList.length)]; 

// After
String item = myList.getRandom(); 
```
