//
//  NewTableViewCell.swift
//  Test2.swift
//
//  Created by M M on 12/6/20.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index: Int)
}

class NewTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!

    var cellDelegate: TableViewNew?
    var index: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func goToThread(_ sender: Any) {
        cellDelegate?.onClickCell(index: (index?.row)!)
    }
}
