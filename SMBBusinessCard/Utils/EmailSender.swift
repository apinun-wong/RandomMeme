//
//  EmailSender.swift
//  MVVM+Clean
//
//  Created by Apinun on 10/7/2566 BE.
//

import Foundation
import MessageUI

// How to improve click this link https://stackoverflow.com/questions/25981422/how-to-open-mail-app-from-swift
extension UIViewController {
    func launchEmail(email: String, subject: String, message: String) {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailVc: MFMailComposeViewController = MFMailComposeViewController()
        mailVc.mailComposeDelegate = self
        mailVc.setSubject(subject)
        mailVc.setMessageBody(message, isHTML: false)
        mailVc.setToRecipients([email])
        self.present(mailVc, animated: true)
    }
}

extension UIViewController: MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(error?.localizedDescription ?? "Something went wrong.")")
        default:
            break
        }
        controller.dismiss(animated: true)
    }
}
