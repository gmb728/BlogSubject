//
//  PixnetTableViewController.swift
//  BlogSubject
//
//  Created by Chang Sophia on 2/5/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import UIKit

 
class PixnetTableViewController: UITableViewController {
    var date: [String] = []
    var subject: [String] = []
    var author: [String] = []
    var type: [String] = []
    var popular: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "http://gsx2json.com/api?id=1aEh76KQCAjjMTvHEOSP9vQHFuszclzVZsIbtH-8KvNQ&columns=false".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                let url = URL(string: urlStr!)
                
                let task = URLSession.shared.dataTask(with: url!) { (data, respose, error) in
                    if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                       
                        DispatchQueue.main.async{
                            
                            for bookstore in dic {
                                self.date.append(bookstore["date"] as! String)
                            }
                            for bookstore in dic {
                                self.subject.append(bookstore["subject"] as! String)
                            }
                            for bookstore in dic {
                                self.author.append(bookstore["author"] as! String)
                            }
                            for bookstore in dic {
                                self.popular.append(bookstore["popular"] as! String)
                            }
                           
                            self.tableView.reloadData()
                    
                }
            }
         }
            task.resume()
        }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let detailController = segue.destination as? DetailTableViewController
            if let row = tableView.indexPathForSelectedRow? .row {
                let bookstore: [Any] = [date[row], subject[row], author[row], type[row], popular[row]]
                
                detailController?.pixnet = bookstore
            }
    }
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let subject = self.subject[indexPath.row]
        let popular = self.popular[indexPath.row]
        cell.textLabel?.text = subject
        cell.detailTextLabel?.text = popular
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PixnetCell", for: indexPath)
            
            configure(cell: cell, forItemAt: indexPath)
            return cell
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
            return subject.count
    }}
