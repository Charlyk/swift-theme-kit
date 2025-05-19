import SnapshotTesting
import Testing
import SwiftUI
@testable import SwiftThemeKitDemo

@MainActor
struct SwiftThemeKitDemoTests {
  @Test func testExampleViewSnapshot() {
    let views: [(String, AnyView)] = [
      ("ButtonsView", AnyView(ButtonsView(shapes: .rounded))),
      ("CheckboxesView", AnyView(CheckboxesView())),
      ("ColorsView", AnyView(ColorsView())),
      ("RadiiView", AnyView(RadiiView())),
      ("RadioGroupView", AnyView(RadioGroupView(shapes: .constant(.rounded)))),
      ("ShadowsView", AnyView(ShadowsView())),
      ("ShapesView", AnyView(ShapesView())),
      ("SpacingsView", AnyView(SpacingsView())),
      ("StrokesView", AnyView(StrokesView())),
      ("TextFieldsView", AnyView(TextFieldsView(shapes: .rounded))),
      ("TypographyView", AnyView(TypographyView()))
    ]

    for (name, view) in views {
      let hostingController = UIHostingController(rootView: view)
      hostingController.view.backgroundColor = .clear
      assertSnapshots(of: hostingController, as: [name: .image], record: true)
    }
  }
}
