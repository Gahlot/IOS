//
//  ViewController.swift
//  SheetAPIDemo
//
//  Created by Mahesh Gahlot on 1/24/19.
//  Copyright © 2019 finoit. All rights reserved.
//


import UIKit
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher
class ViewController: UIViewController , GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var submitButton: UIButton!
    private let scopes = [kGTLRAuthScopeSheetsSpreadsheets]
    private var sheet = GTLRSheetsService()
    private var gTLsheet = GTLRSheets_Spreadsheet()
    var spreadsheetID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HHH")
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance()?.scopes = scopes
        GIDSignIn.sharedInstance().signIn()
        // view.addSubview(signInButton)
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
           print("Error \(error)")
            // signIn.showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.sheet.authorizer = nil
            
            
        } else {
            self.sheet.authorizer = user.authentication.fetcherAuthorizer()
           
            
            CreateSpreadSheet()
            
        }
    }
    
    func CreateSpreadSheet() {
       
        let properties = GTLRSheets_SpreadsheetProperties()
        properties.title = "Address_Book_TEMP_F01"
        gTLsheet.properties = properties
        let sheet_0 = GTLRSheets_Sheet()
        sheet_0.properties = GTLRSheets_SheetProperties()
        sheet_0.properties?.title = "Sheet_0"
        gTLsheet.sheets = [sheet_0]
        
       
        let query = GTLRSheetsQuery_SpreadsheetsCreate.query(withObject: gTLsheet)
        sheet.executeQuery(query,delegate: self,didFinish: #selector(displayResultWithTicket))
        //let spreadsheetId = gTLsheet.spreadsheetId!
        
    }
    
@objc func displayResultWithTicket(ticket: GTLRServiceTicket,
                                 finishedWithObject result : GTLRSheets_Spreadsheet,
                                 error : NSError?) {
        
        if let err = error {
            print("ERROR = \(err)")
            return
        }
   
     print("ID = \(result.spreadsheetId ?? "NULL")")
    print("URL = \(result.spreadsheetUrl ?? "NULL")")
    let sheet_0 = GTLRSheets_Sheet()
    sheet_0.properties = GTLRSheets_SheetProperties()
    sheet_0.properties?.title = "Sheet0"
    result.sheets = [sheet_0]
    gTLsheet = result
    
    
    
//
//        var majorsString = ""
//        let rows = result.values!
//
//        if rows.isEmpty {
//            print("No data found.")
//            return
//        }
    }

}

