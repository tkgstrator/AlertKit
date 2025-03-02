import SwiftUI

@available(iOS 13.0, *)
extension View {
    public func present(isPresented: Binding<Bool>, content: () -> AlertAppleMusic17View, completion: (()->Void)? = nil) -> some View {
        if isPresented.wrappedValue {
            let wrapperCompletion = {
                isPresented.wrappedValue = false
                completion?()
            }
            if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
                content().present(on: window, completion: wrapperCompletion)
            }
        }
        return self
    }
}
