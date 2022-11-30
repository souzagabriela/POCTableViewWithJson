//
//  ViewController.swift
//  POCTableView
//
//  Created by Gabriela Souza Batista on 29/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()

    var receitas = JsonTeste.instance.loadjson()
//    teste = teste?.filter{$0 == "Chocolate"}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        func filtrarReceitas(with palavras: [String])->[Afrodite] {
            
            var receitasNomes: [Afrodite] = []
            
            for receita in self.receitas {
                for conteudo in receita.secao[0].conteudo {
                    for palavra in palavras {
                        if conteudo.contains(palavra) {
                            receitasNomes.append(receita)
                        }
                    }
                }
            }
            return receitasNomes
        }
        
        self.receitas = filtrarReceitas(with: ["cuscuz"])
        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(receitas.count)
        return receitas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = receitas[indexPath.row].nome
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HelloWorldViewController()
        vc.model = receitas[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

