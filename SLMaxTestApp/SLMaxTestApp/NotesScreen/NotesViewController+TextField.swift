//
//  NotesViewController+TextField.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation
import UIKit

extension NotesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let preText = textField.text as NSString?,
              preText.replacingCharacters(in: range, with: string).count <= Constants.Note.titleMaxCharactersCount else {
            return false
        }
        return true
    }
}
