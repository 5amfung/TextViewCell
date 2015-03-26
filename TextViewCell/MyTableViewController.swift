
import Foundation
import UIKit


class MyTableViewController : UITableViewController, TextViewCellDelegate {

    var data:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 40
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRectZero)

        self.data = ["Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5", "Cell 6", "Cell 7", "Cell 8"]

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TextViewCell", forIndexPath: indexPath) as TextViewCell
        cell.textView.text = self.data[indexPath.row]
        cell.delegate = self
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func textViewCell(cell: TextViewCell, didChangeText text: String) {
        let size = cell.textView.frame.size
        let newSize = cell.textView.sizeThatFits(CGSizeMake(size.width, CGFloat.max))

        if size.height != newSize.height {
//            UIView.setAnimationsEnabled(false)
            cell.textView.frame.size = newSize
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
//            UIView.setAnimationsEnabled(true)

//            let indexPath = self.tableView.indexPathForCell(cell)
//            if let indexPath_ = indexPath {
//                self.tableView .scrollToRowAtIndexPath(indexPath_, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
//            }
        }
    }
}