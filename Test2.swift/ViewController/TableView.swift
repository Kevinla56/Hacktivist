//
//  TableView.swift
//  Test2.swift
//
//  Created by M M on 12/7/20.
//

import UIKit

class TableView: UIViewController {
    @IBOutlet var tableView: UITableView!
    var threadTitle = [String]()
    var replies = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filename = getDocumentsDirectory().appendingPathComponent("threadData.txt")
        
        if let titles = try? String(contentsOf: filename) {
            threadTitle = titles.components(separatedBy: ",")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func newThread(_ title: String) {
        threadTitle.append(title)
    }

    func newReply(_ reply: String) {
        replies.append(reply)
    }
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        cell?.nameLabel.text = threadTitle[indexPath.row]
        return cell!
    }
}
