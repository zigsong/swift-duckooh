//
//  AlertViewController.swift
//  Myday6
//
//  Created by songji on 2020/12/18.
//

import SwiftUI
import UIKit

struct AlertViewController: UIViewControllerRepresentable {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var textString: String
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertViewController>) -> UIViewController {
         return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AlertViewController>) {
        guard context.coordinator.alert == nil else { return }
       
        if self.showAlert {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            context.coordinator.alert = alert
           
            alert.addTextField { textField in
                textField.placeholder = "new category name"
                textField.text = self.textString
                textField.delegate = context.coordinator
            }
           
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "") , style: .destructive) { _ in
                    alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            })
           
            alert.addAction(UIAlertAction(title: NSLocalizedString("Add", comment: ""), style: .default) { _ in
                if let textField = alert.textFields?.first, let text = textField.text {
                    self.textString = text
                }
                
                // moved from MyboxView
                let category = Category(context: self.managedObjectContext)
                category.name = self.textString
                category.item = "temp"
                category.createdAt = Date()
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                // ---

               
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            })
           
            DispatchQueue.main.async { // must be async !!
                uiViewController.present(alert, animated: true, completion: {
                    self.showAlert = false
                    context.coordinator.alert = nil
                })
               
            }
       }
        
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var alert: UIAlertController?
        var control: AlertViewController
        
        init(_ control: AlertViewController) {
            self.control = control
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text as NSString? {
                self.control.textString = text.replacingCharacters(in: range, with: string)
            } else {
                self.control.textString = ""
            }
            return true
        }
    }
}


//struct AlertViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertViewController()
//    }
//}
