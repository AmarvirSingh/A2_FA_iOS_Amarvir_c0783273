//
//  ProductTVC.swift
//  A2_FA_iOS_Amarvir_c0783273
//
//  Created by Amarvir Mac on 30/01/21.
//  Copyright © 2021 Amarvir Mac. All rights reserved.
//

import UIKit
import CoreData

class ProductTVC: UITableViewController {
    
    
    var products = [Product]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadProducts()
            //newProduct()
        showSearchBar()

       
    }
    
    func showSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Product"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.searchTextField.textColor = .lightGray
    }
    

    func loadProducts(predicate:NSPredicate? = nil ){
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        if let pred = predicate{
            request.predicate = pred
        }
        
        do{
            products = try context.fetch(request)
            tableView.reloadData()
        }catch{
            print (error)
        }
    }
    
    
    func newProduct(){
        
        let newProduct = Product(context: context)
        newProduct.name = "Oneplus Buds Pro"
        newProduct.id = 119
        newProduct.price = 399
        newProduct.desc = "This is the description of Oneplus buds pro. they are laets buds from the company. Bass is very deep and vocal are somewhat clear."
        newProduct.provider = "Oneplus"
        products.append(newProduct)
        
        let newProduct1 = Product(context: context)
        newProduct1.name = "Mac Book Air"
        newProduct1.id = 112
        newProduct1.price = 1019
        newProduct1.desc = "This is the description of Mac book Air. it has 4gb ram and 512 gb flash drive"
        newProduct1.provider = "Apple"
        products.append(newProduct1)
        
        let newProduct2 = Product(context: context)
        newProduct2.name = "Benq GW2270 Monitor"
        newProduct2.id = 113
        newProduct2.price = 149
        newProduct2.desc = "This is the description of Benq 22 inch model monitor . it has built in speakers and 2 hdmi ports with one vga port. Monitor has 1080p resolution"
        newProduct2.provider = "Benq"
        products.append(newProduct2)
        
        let newProduct3 = Product(context: context)
        newProduct3.name = "CosmicByte RGB Gaming Keyboard"
        newProduct3.id = 114
        newProduct3.price = 50
        newProduct3.desc = "This is the description of Cosmic byte rgb keuboard. it has various typs of color in his keyboard. design is fit for gamers "
        newProduct3.provider = "CosmicByte"
        products.append(newProduct3)
        
        
        let newProduct4 = Product(context: context)
        newProduct4.name = "CosmicByte Gaming Mouse"
        newProduct4.id = 115
        newProduct4.price = 39
        newProduct4.desc = "This is the description of Cosmic byte gaming mouse. this mouse has 3 rgb lights, and has 5 buttons "
        newProduct4.provider = "CosmicByte"
        products.append(newProduct4)
        
        let newProduct5 = Product(context: context)
        newProduct5.name = "RedGear Scream Headphones"
        newProduct5.id = 116
        newProduct5.price = 89
        newProduct5.desc = "This is the description of Redgear gaming headphones. model name is Scream, this also has RGB and vibration motor for Deep Bass"
        newProduct5.provider = "Redgear"
        products.append(newProduct5)
        
        let newProduct6 = Product(context: context)
        newProduct6.name = "OnePlus 5t"
        newProduct6.id = 117
        newProduct6.price = 699
        newProduct6.desc = "This is the description of Oneplus 5t. this is predecessor of one plus 5 phone. it has 8gb ram and 128 gb fast storage . this phone has dual camera setup for fantastic captures"
        newProduct6.provider = "Oneplus"
        products.append(newProduct6)
        
        let newProduct7 = Product(context: context)
        newProduct7.name = "OnePLus 8t pro"
        newProduct7.id = 118
        newProduct7.price = 799
        newProduct7.desc = "This is the description of one plus's latest flagship phone. it has the curved screen with 120 hertz display. it has th laser focus 3 camera setup"
        newProduct7.provider = "Oneplus"
        products.append(newProduct7)
        
        
        do{
            try context.save()
            tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row].name
        cell.imageView?.image = UIImage(systemName: "star.fill")
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        let destination = segue.destination as! ViewController
        let indexPath = tableView.indexPathForSelectedRow
        
        destination.selectedProduct = products[indexPath!.row]
        
        
    }
    

}

extension ProductTVC: UISearchBarDelegate {
    
    
    /// search button on keypad functionality
    /// - Parameter searchBar: search bar is passed to this function
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // add predicate
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
        loadProducts(predicate: predicate)
    }
    
    
    /// when the text in text bar is changed
    /// - Parameters:
    ///   - searchBar: search bar is passed to this function
    ///   - searchText: the text that is written in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadProducts()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
       
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadProducts()
    }
    
}
