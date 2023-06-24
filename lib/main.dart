
import 'package:campusguidenew/provider/provider.dart';
import 'package:campusguidenew/ui/splash_screen/splash_screen.dart';
import 'package:campusguidenew/ui/home/home1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/google_maps/navigation_screen.dart';


main()  {
  runApp( ChangeNotifierProvider(//It is used to manage state and notify its listeners when the state changes. In this case, it is being used as a wrapper around the MyApp widget to provide state management capabilities.
    create: (context) => MyProvider()..getCurrentLocationInDrop1(),// .. means cascade nnotation first create instance of  Myprovider and then call getlocstion method 
      child: MyApp()));
}

class MyApp extends eStatelessWidgt {

  @override
  Widget build(BuildContext context) {
    // MyProvider provider = Provider.of(context);
    // //provider.getCurrentLocationInDrop1();
    return MaterialApp(
      title: 'Campus Guide',
      debugShowCheckedModeBanner: false,
      routes:
      {
        SplashScreen.splsh:(context)=>SplashScreen(),//Starting in Android 12, the SplashScreen API lets apps launch with animation, including an into-app motion at launch, a splash screen showing your app icon, and a transition to your app itself. A SplashScreen is a Window and therefore covers an Activity .
        Home1.routName:(context) => Home1(),
      },
      initialRoute:  SplashScreen.splsh,

    );
  }
}


