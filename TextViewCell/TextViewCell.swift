

import Foundation
import UIKit


protocol TextViewCellDelegate {
    func textViewCell(cell: TextViewCell, didChangeText text: String)
}


class TextViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet var textView: UITextView!

    var delegate: TextViewCellDelegate?

    func textViewDidChange(textView: UITextView) {
//        var bounds = self.textView.bounds
//
//        let maxSize = CGSizeMake(bounds.size.width, CGFloat.max)
//        var newSize = self.textView.sizeThatFits(maxSize)
//        bounds.size = newSize
//
//        self.textView.bounds = bounds

        if let delegate_ = delegate {
            delegate_.textViewCell(self, didChangeText: textView.text)
        }
    }
}