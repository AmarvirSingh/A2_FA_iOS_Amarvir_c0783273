//
//  ViewController.swift
//  A2_FA_iOS_Amarvir_c0783273
//
//  Created by Amarvir Mac on 30/01/21.
//  Copyright © 2021 Amarvir Mac. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var provider: UITextField!
    
    @IBOutlet weak var descrip: UITextView!
    
    
    
    
    
    var products = [Product]()
    
    var selectedProduct : Product?
    {
        didSet{
            loadProduct()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadProduct()
        showData()
    }
    
    func loadProduct(){
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        let predicate = NSPredicate(format: "prodata.name = %@", selectedProduct!.name!)
        
        request.predicate = predicate
        
        do{
            products = try context.fetch(request)
            
        }catch{
            print ("error loading data \(error.localizedDescription)")
        }
    }

    func showData(){
        name.text = selectedProduct?.name
        id.text = "\(selectedProduct!.id)"
        price.text = String(selectedProduct!.price)
        descrip.text = selectedProduct!.desc
        provider.text = selectedProduct?.provider
    }

}

