A FLutter Messaging App with Embedded Internal Tools Dashboard

This project is a Flutter messaging app integrated with an Angular + Tailwind internal tools dashboard loaded inside a WebView.

Project Structure 

/flutter_app/       # Flutter messaging interface + WebView

/webpage/           # Angular + Tailwind internal dashboard
/screen recording /


1. Start Angular HTTP Server
   
    (1) Open a terminal and navigate to the Angular project folder:

        cd webpage
    (2) Install dependencies :
   
        npm install
    (3) Start the local development server:
   
       npm start
   
   Notes:
   
   - Local access: http://localhost:4200/
     
   - Android emulator: http://10.0.2.2:4200/
     
   - Real device on same Wi-Fi: http://<YOUR_PC_IP>:4200/
   
    (4) Open in browser to verify
   
3. Run the Flutter App
   
    (1) Open flutter projects in Android studio or VS code
   
    (2) Install dependencies:
   
        flutter pub get
   
    (3) Update WebView URL in DashboardView.dart
   
   // For emulator:
   
   final urlToLoad = "http://10.0.2.2:4200";
   
   // For real device:
   
   final urlToLoad = "http://192.168.x.x:4200";
   
    (4) Make sure Android has HTTP permission in AndroidManifest.xml:
   
       <uses-permission android:name="android.permission.INTERNET"/>
       <application
           android:usesCleartextTraffic="true"
       >
       >(5) Run the Flutter app
   
5. Features / Assumptions
   
    (1) Fully native Flutter chat interface
   
    • Chat bubbles (incoming/outgoing)
   
    • Timestamps
   
    • Scroll-to-latest on new messages
   
    • Text input + send button
   
    • Simulated support agent response ( auto-reply )
   
    • Embed the Angular web app in a WebView
   
    • Message persistence using Hive
   
    • Notification badge for new messages
   
    • support emoji messages
   
    (2) Angular Dashboard:
   
    • Ticket Viewer (table with dummy data and filters)
   
    • Knowledgebase Editor (Markdown/rich-text preview)
   
    • Live logs panel (simulated real-time logs)
   
    • Navigation  top nav bar
   
    • Tailwind CSS for styling

7. Notes
    • Make sure the Angular server and Flutter app run on the same network when using real devices.

    • For Android emulators, use 10.0.2.2 as the host to reach your PC localhost.

8. Screenshots

   
![1](https://github.com/user-attachments/assets/1e4dd440-fa3d-407b-997d-b31b3c1f8357)


![2](https://github.com/user-attachments/assets/4ff0740f-4944-4a85-9d01-5aa0a38dd630)


![3](https://github.com/user-attachments/assets/bfc058b6-9492-4869-bd2a-4c1e72ff753c)


![4](https://github.com/user-attachments/assets/03f0f65f-ef8b-4e3d-b600-31f498abfc5e)

