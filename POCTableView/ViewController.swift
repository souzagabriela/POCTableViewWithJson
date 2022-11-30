//
//  ViewController.swift
//  POCTableView
//
//  Created by Gabriela Souza Batista on 29/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()

    var teste = JsonTeste.instance.loadjson()
//    teste = teste?.filter{$0 == "Chocolate"}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
//        print(teste?[1].nome.contains("Chocolate"))
        print(teste?[0].secao[0].conteudo.contains("50 g farinha de milho fina"))
        if ((teste?[0].nome.contains("Chocolate")) == true) {
            print("deu bom")
        } else {
            print("deu ruim")
        }
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teste!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teste?[indexPath.row].nome
        cell.textLabel?.numberOfLines = 0

        return cell
    }

}

