//
//  ListController.swift
//  Pods-RealmToDoList
//
//  Created by Cat on 3/16/18.
//

import UIKit

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    struct Segues {
        static let detailSegue = "showDetailSegue"
    }
    
    struct EditButtonText {
        static let edit = "Edit"
        static let done = "Done"
    }
    
    @IBOutlet weak var toDoTable: UITableView!
    @IBOutlet weak var editBarBtn: UIBarButtonItem!
    @IBOutlet weak var addBarBtn: UIBarButtonItem!
    
    private var storedObjects = Storage.shared.realmRecords?.first?.taskList
    private var selectedRowIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTable.delegate = self
        toDoTable.dataSource = self
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        toDoTable.reloadData()
    }
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (storedObjects?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ToDoCell.self), for: indexPath) as! ToDoCell
        print("Index:", indexPath.row)
        let data = storedObjects![indexPath.row]
        cell.setData(data)

        return cell
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedRowIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ListController.Segues.detailSegue
        {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            let destination = segue.destination as! DescriptionController
            let data = storedObjects![selectedRowIndex!]
            let creationDateString = formatter.string(from: data.taskCreatedData as Date)
            
            destination.name = data.taskName
            destination.desc = data.taskDescription
            destination.taskObject = data
            destination.dateCreated = creationDateString
        }
    }
    
    @IBAction func tapEditBtn(_ sender: Any) {
        toDoTable.setEditing(!toDoTable.isEditing, animated: true)
        if toDoTable.isEditing == false {
            editBarBtn.title = ListController.EditButtonText.edit
            addBarBtn.isEnabled = true
        } else {
            editBarBtn.title = ListController.EditButtonText.done
            addBarBtn.isEnabled = false
        }
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Storage.realm?.beginWrite()
        let movedObject = storedObjects![sourceIndexPath.row]
        storedObjects!.remove(at: sourceIndexPath.row)
        storedObjects!.insert(movedObject, at: destinationIndexPath.row)
        try! Storage.realm?.commitWrite()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Storage.realm!.beginWrite()
            storedObjects!.remove(at: indexPath.row)
            try! Storage.realm!.commitWrite()
            tableView.reloadData()
        }
    }

    
}
