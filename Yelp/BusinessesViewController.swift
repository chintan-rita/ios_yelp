//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController:  UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, FilterViewControllerDelegate  {
    
    var businesses: [Business]!
    @IBOutlet weak var businessesTableView: UITableView!
    var filters = [String : AnyObject]()

    var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.businessesTableView.rowHeight = UITableViewAutomaticDimension
        self.businessesTableView.estimatedRowHeight = 120
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.resignFirstResponder()
        navigationItem.titleView = searchBar
        
        loadYelpResults("")
    }
    
    func loadYelpResults(searchText: String) {
        JTProgressHUD.show()
        var searchTerm = "Restaurants"
        if !searchText.isEmpty {
          searchTerm = searchText
        }
        Business.searchWithTerm(searchTerm,
            sort: self.filters["sortingType"]?.integerValue,
            categories: self.filters["categories"] as? [String],
            deals: self.filters["deals"]?.boolValue,
            location: self.filters["location"]?.stringValue,
            distance: self.filters["distance"]?.doubleValue) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            JTProgressHUD.hide()
            self.businessesTableView.reloadData()
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if businesses != nil {
            return businesses!.count
        }
        else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = businessesTableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = self.businesses[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchText = searchBar.text
        view.endEditing(true)
        self.searchBar.endEditing(true)
        if ((searchText?.isEmpty) != nil) {
            loadYelpResults(searchText!)
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText:String) {
        if(searchText.isEmpty) {
            view.endEditing(true)
            self.searchBar.endEditing(true)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        let navigationController = segue.destinationViewController as! UINavigationController
        let filterViewController = navigationController.topViewController as! FilterViewController
        filterViewController.delegate = self
    }
    
    func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        self.filters = filters
        
        loadYelpResults("")
    }
    
    

    
}