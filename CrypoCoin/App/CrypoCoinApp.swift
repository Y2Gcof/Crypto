import SwiftUI
import FirebaseCore
import FirebaseFirestore
@main
struct CrypoCoinApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userMV = UserViewModel()
    @StateObject var homeMV = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            FlowScreens()
                .environmentObject(userMV)
                .environmentObject(homeMV)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

//    print("FireBase works!")
    return true
  }
}

