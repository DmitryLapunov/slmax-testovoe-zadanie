//
//  NotesViewController+Extension.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation
import UIKit

extension NotesViewController {
    func handleObserver(observerAction: HandleObserver) {
        switch observerAction {
        case .add:
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillShow),
                                                   name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillHide),
                                                   name: UIResponder.keyboardWillHideNotification, object: nil)
        case .remove:
            NotificationCenter.default.removeObserver(self,
                                                      name: UIResponder.keyboardWillShowNotification,
                                                      object: nil)
            NotificationCenter.default.removeObserver(self,
                                                      name: UIResponder.keyboardWillHideNotification,
                                                      object: nil)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        controllerView.frame.origin.y = 0 - keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        controllerView.frame.origin.y = 0
    }
}
