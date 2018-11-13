//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_MODULENAME___Assembly {
    
    func build() -> UIViewController {
        let view = ___VARIABLE_MODULENAME___ViewController()
        let interactor = ___VARIABLE_MODULENAME___Interactor()
        let router = ___VARIABLE_MODULENAME___Router()
        let presenter = ___VARIABLE_MODULENAME___Presenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
