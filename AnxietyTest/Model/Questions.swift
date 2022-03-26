import Foundation

struct Questions {
    static let arr : [String] = ["1. Feeling nervous, anxious, or on edge".localized(),"2. Not being able to stop or control worrying".localized(),"3. Worrying too much about different things".localized(),"4. Trouble relaxing ".localized(),"5. Being so restless that it is hard to sit still ".localized(),"6. Becoming easily annoyed or irritable ".localized(),"7. Feeling afraid, as if something awful might happen".localized()]
    static var currentQuestion = 0
}

extension String{
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
