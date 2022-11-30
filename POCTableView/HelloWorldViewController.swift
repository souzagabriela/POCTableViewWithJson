//
//  HelloWorldViewController.swift
//  POCTableView
//
//  Created by Vinícius Cavalcante on 30/11/22.
//

import UIKit

class HelloWorldViewController: UIViewController {
    
    var model: Afrodite?

    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemRed
        label.text = model!.nome
        print(model?.nome ?? "Error", "nova controller")
        labelContraints()
    }
    
    func labelContraints() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
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
