//
//  SplitoUITests.swift
//  SplitoUITests
//
//  Created by Shahid Latif on 13/04/2022.
//

import XCTest

class SplitoUITests: XCTestCase {
    
    let splitHomePO = SplitHomePO()
    
    override func setUp() {
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        XCUIApplication().terminate()
    }
    

    func testIncrementButton(){
        let splitOPO = SplitHomePO()
        let originalPersonCount = splitOPO.totalPerson_Bill.label
        splitOPO.incrementButton.tap()
        let newPersonCount = splitOPO.totalPerson_Bill.label
        XCTAssertTrue((newPersonCount as NSString).integerValue==((originalPersonCount as NSString).integerValue+1), "INCREMENT NOT WORKING")
    }
    
    func testDecrementButton(){
        let splitOPO = SplitHomePO()
        splitOPO.incrementButton.tap()
        let originalPersonCount = splitOPO.totalPerson_Bill.label
        splitOPO.decrementButton.tap()
        let newPersonCount = splitOPO.totalPerson_Bill.label
        XCTAssertTrue((newPersonCount as NSString).integerValue==((originalPersonCount as NSString).integerValue-1), "INCREMENT NOT WORKING")
    }
    
    func verifyzeroTip(){
        let amount : Int = 1000
        let splitOPO = SplitHomePO()
        splitOPO.enterBillAmount.tap()
        splitOPO.enterBillAmount.typeText(String(amount))
        splitOPO.application.toolbars["Toolbar"].buttons["Done"].tap()
        splitOPO.tapPercenage(per: .zeroPercetage)
        splitOPO.calculatorButton.tap()
        let totalAmount = splitOPO.totalBill.label
        XCTAssertTrue((totalAmount as NSString).integerValue*2==1000,"ZERO PERCENT TIP FAILED")
    }
    
    
    // Sample for your first test case.
    func testWhenApplicationDefaultStateWhenApplicationLaunched() throws {
        
        let splitOPO = SplitHomePO()
        splitOPO.enterBillAmount.tap()
        splitOPO.enterBillAmount.typeText("1000")
        splitOPO.application.toolbars["Toolbar"].buttons["Done"].tap()
        splitOPO.incrementButton.tap()
        splitOPO.tapPercenage(per: .fifteenPercentage)
        splitOPO.calculatorButton.tap()
        let data = splitOPO.totalBill
        print(data.label)
    }
}
