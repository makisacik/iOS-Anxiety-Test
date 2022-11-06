import Foundation

struct Questions {

    static let arr : [String] = ["first_question".localized(),"second_question".localized(),"third_question".localized(),"fourth_question".localized(),"fifth_question".localized(),"sixth_question".localized(),"seventh_question".localized()]
    
    static var currentQuestion = 0

}

extension String{
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
