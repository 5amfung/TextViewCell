

import Foundation
import UIKit


protocol TextViewCellDelegate {
    func textViewCell(cell: TextViewCell, didChangeText text: String)
}


class TextViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet var textView: UITextView!

    var delegate: TextViewCellDelegate?

    func textViewDidChange(textView: UITextView) {
        if let delegate_ = delegate {
            delegate_.textViewCell(self, didChangeText: textView.text)
        }
    }
}