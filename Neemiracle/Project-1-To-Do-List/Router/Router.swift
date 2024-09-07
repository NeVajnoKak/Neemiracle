import SwiftUI

class Router : ObservableObject {
    enum Route {
        case list
        case done
    }
    
    @Published var currentRoute:Route = .list
    public func navigate(to route: Route){
        currentRoute = route
    }
    
}
