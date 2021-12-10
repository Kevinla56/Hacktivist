import Firebase
import FirebaseDatabase
import UIKit

class postThread: TableView {
    @IBOutlet var postTitle: UITextField!
    @IBOutlet var postBody: UITextView!
    @IBOutlet var replyMsg: UITextField!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func postPressed(_ sender: Any) {
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser!.uid
        let postRef = ref.child("post")
        let newPostRef = postRef.child(uid).child(self.postTitle.text!)
        newPostRef.setValue(["body": self.postBody.text!])
        newThread(self.postTitle.text!)
        let title = self.postTitle.text!
        
        self.writeToFile(content: title, fileName: "threadData.txt")
        
        dump(threadTitle)
        print(getDocumentsDirectory())
        _ = navigationController?.popViewController(animated: true)
    }

    func writeToFile(content: String, fileName: String) {
        let contentToAppend = content + ","
        let filePath = NSHomeDirectory() + "/Documents/" + fileName

        // Check if file exists
        if let fileHandle = FileHandle(forWritingAtPath: filePath) {
            // Append to file
            fileHandle.seekToEndOfFile()
            fileHandle.write(contentToAppend.data(using: String.Encoding.utf8)!)
        } else {
            // Create new file
            do {
                try contentToAppend.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Error creating \(filePath)")
            }
        }
    }
}
