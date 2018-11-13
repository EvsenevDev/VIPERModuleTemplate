//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_MODULENAME___Presenter: ___VARIABLE_MODULENAME___PresenterProtocol {
    private var interactor: ___VARIABLE_MODULENAME___InteractorProtocol
    private var router: ___VARIABLE_MODULENAME___RouterProtocol
    weak var view: ___VARIABLE_MODULENAME___ViewProtocol!
    
    init(view: ___VARIABLE_MODULENAME___ViewProtocol, interactor: ___VARIABLE_MODULENAME___InteractorProtocol, router: ___VARIABLE_MODULENAME___RouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
