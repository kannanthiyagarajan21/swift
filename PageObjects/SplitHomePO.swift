//
//  SplitHomePO.swift
//  SplitoUITests
//
//  Created by Shahid Latif on 13/04/2022.
//

import XCTest

struct SplitHomePO {
    var application: XCUIApplication
    var enterBillAmount : XCUIElement
    var incrementButton : XCUIElement
    var calculatorButton : XCUIElement
    var totalBill : XCUIElement
    var totalPerson_Bill : XCUIElement
    var decrementButton : XCUIElement
    
    init(app: XCUIApplication = XCUIApplication()) {
        application = app
        enterBillAmount =  application.textFields[AccessibilityIdentifierEnum.billAmount.rawValue]
        incrementButton = application.buttons[AccessibilityIdentifierEnum.incrementPerson.rawValue]
//        percentageButton = application.buttons[tapPercenage(per: )]
        calculatorButton = application.buttons[AccessibilityIdentifierEnum.calculate_bill_button.rawValue]
        totalBill = application.staticTexts[AccessibilityIdentifierEnum.total_bill_per_person.rawValue]
        totalPerson_Bill = application.staticTexts[AccessibilityIdentifierEnum.totalPerson.rawValue]
        decrementButton = application.buttons[AccessibilityIdentifierEnum.decrementPerson.rawValue]
    }
    
    private enum AccessibilityIdentifierEnum : String{
        case billAmount = "bill_entered_amount"
        case incrementPerson = "increment_person"
        case percent10 = "10_percent"
        case calculate_bill_button = "calculate_bill_button"
        case total_bill_per_person = "total_bill_each_person"
        case totalPerson = "total_person_in_bill"
        case decrementPerson = "decrement_person"
    }
    
    enum percentageButtonEnum : String {
        case zeroPercetage = "0_percent"
        case tenPercentage = "10_percent"
        case fifteenPercentage = "15_percent"
        case twentyPercentage = "20_percent"
    }
    
    func tapPercenage(per: percentageButtonEnum) {
        
        application.buttons[per.rawValue].tap()
//        return per.rawValue
    }
    
}
