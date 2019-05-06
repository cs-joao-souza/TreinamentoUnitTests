import Quick
import Nimble
import Nimble_Snapshots
@testable import TreinamentoTests

class ReusableViewSpec: QuickSpec {
    override func spec() {
        describe("ReusableView") {
            
            var sut: ReusableView!
            
            beforeEach {
                sut = ReusableView()
                let size = SizeHelper.calculateSize(view: sut, width: 375)
                sut.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            }
            
            context("when it is instantiated") {
                it("has to build the layout properly") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
