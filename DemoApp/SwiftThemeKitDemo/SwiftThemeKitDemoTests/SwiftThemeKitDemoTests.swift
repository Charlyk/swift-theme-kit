import SnapshotTesting
import Testing
import SwiftUI
@testable import SwiftThemeKitDemo

@MainActor
struct SwiftThemeKitDemoTests {
  @Test func testExampleViewSnapshot() {
    let buttonsView = AnyView(ButtonsView(shapes: .rounded))
    let checkboxesView = AnyView(CheckboxesView())
    let colorsView = AnyView(ColorsView())
    let radiiView = AnyView(RadiiView())
    let radioGroupView = AnyView(RadioGroupView(shapes: .constant(.rounded)))
    let shadowsView = AnyView(ShadowsView())
    let shapesView = AnyView(ShapesView())
    let spacingsView = AnyView(SpacingsView())
    let strokesView = AnyView(StrokesView())
    let textFieldsView = AnyView(TextFieldsView(shapes: .rounded))
    let typographyView = AnyView(TypographyView())

    let views: [AnyView] = [buttonsView, checkboxesView, colorsView, radiiView, radioGroupView, shadowsView, shapesView, spacingsView, strokesView, textFieldsView, typographyView]

    for view in views {
      let hostingController = UIHostingController(rootView: view)
      hostingController.view.backgroundColor = .clear
      assertSnapshots(of: hostingController, as: [String(describing: view): .image], record: false)
    }
  }
}
