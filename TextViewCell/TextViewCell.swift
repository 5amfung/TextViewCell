

import Foundation
import UIKit


protocol TextViewCellDelegate {
    func textViewCell(cell: TextViewCell, didChangeText text: String)
}


class TextViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet var textView: UITextView!

    var delegate: TextViewCellDelegate?

    lazy var tableView: UITableView = {
        var tableView = self.superview

        while !(tableView is UITableView) && tableView != nil {
            tableView = tableView!.superview
        }
        return tableView as UITableView
    }()

    func textViewDidChange(textView: UITextView) {
        if let delegate_ = delegate {
            delegate_.textViewCell(self, didChangeText: textView.text)
        }

        var bounds = self.textView.bounds

        let maxSize = CGSizeMake(bounds.size.width, CGFloat.max)
        var newSize = self.textView.sizeThatFits(maxSize)
        bounds.size = newSize

        self.textView.bounds = bounds

        let tableView = self.tableView
        tableView.beginUpdates()
        tableView.endUpdates()

    }
}