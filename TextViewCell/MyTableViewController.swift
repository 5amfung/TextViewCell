
import Foundation
import UIKit


class MyTableViewController : UITableViewController, TextViewCellDelegate {

    var data:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 40
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRectZero)

        self.data = ["Cell 1", "Cell 2"]

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
        NSLog("\(text)")
    }

}