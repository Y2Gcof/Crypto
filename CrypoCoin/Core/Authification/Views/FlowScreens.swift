
import SwiftUI
enum FlowState: Hashable {
    case auth
    case main
}

struct FlowScreens: View {
    @EnvironmentObject var userMV: UserViewModel
    var body: some View {
        if UserModel.shared.userUid.isEmpty{
            AuthFlowView()
        }
        else{
            HomeView()
                .preferredColorScheme(.dark)
                .transition(.move(edge: .trailing))
        }
    }
}


