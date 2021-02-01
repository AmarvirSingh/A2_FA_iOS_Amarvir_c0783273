//
//  AddViewController.swift
//  A2_FA_iOS_Amarvir_c0783273
//
//  Created by Amarvir Mac on 01/02/21.
//  Copyright © 2021 Amarvir Mac. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var provider: UITextField!
    @IBOutlet weak var disc: UITextView!
    
    
    //creating the instance
    var inst : ProductTVC!
    
    // creating context
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var products = [Product]()
    
    var provi = [Providers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func cancelAdding(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func loadProviders(){
        let request :NSFetchRequest<Providers> = Providers.fetchRequest()
        
        do{
            provi = try context.fetch(request)
            
        }
        catch{
            print("cannot laod providers data in add vc")
        }
        
    }
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        loadProviders()
        saveProduct()
        print(provi.count)
    dismiss(animated: true, completion: nil)
        
    }
    func saveProduct(){
        
        let newPro = Product(context: context)
        newPro.name = name.text
        newPro.id = id.text
        newPro.desc = disc.text
        newPro.price = price.text
        newPro.provider = provider.text
        
        let newProvider = Providers(context: context)
        newProvider.providerName = provider.text
        newProvider.productName = name.text
        provi.append(newProvider)
        do
        {
            try context.save()
        }
        catch{
            print("Cannot svae product ")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
