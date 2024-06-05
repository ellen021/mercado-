import 'dart:io';

class Produto {
  String nome;
  double preco;
  int quantidade;

  Produto(this.nome, this.preco, this.quantidade);
}

void main() {
  List<Produto> produtos = [
    Produto('Arroz Pilão', 7.0, 20),
    Produto('Arroz Tio João', 6.0, 20),
    Produto('Arroz Biu', 10.0, 20),
    Produto('Feijão Carioca', 8.0, 15),
    Produto('Feijão Turquesa', 12.0, 15),
    Produto('Feijão Pai Heleno', 6.0, 15),
    Produto('Óleo de soja', 10.0, 30),
    Produto('Óleo de girassol', 5.0, 30),
    Produto('Óleo de milho', 5.0, 30),
    Produto('Sal', 2.0, 25),
    Produto('Macarrão Ninho', 3.0, 17),
    Produto('Macarrão Spaguette', 3.0, 17),
    Produto('Macarrão Penne', 3.0, 17),
    Produto('Molho de Tomate sabor Pizza', 2.0, 38),
    Produto('Molho de Tomate sabor Parmegiana', 2.0, 38),
    Produto('Molho de Tomate Tradicional', 2.0, 38),
    Produto('Azeite de Oliva Galo', 49.99, 10),
    Produto('Azeite de Oliva Andorinha', 53.99, 13),
    Produto('Leite em pó Camponesa', 8.0, 25),
    Produto('Leite em pó Piracanjuba', 7.0, 25),
    Produto('Leite em pó Ninho', 13.0, 25),
    Produto('Café Pilão', 9.0, 28),
    Produto('Café', 9.0, 28),
    Produto('Café', 9.0, 28),
    Produto('Óleo', 10.0, 25),
    Produto('Batata palito', 25.99, 25),
    Produto('Frango', 22.0, 25),
    Produto('Pão de queijo', 15.0, 25),
    Produto('Polpa de fruta congelada', 2.0, 25),
    Produto('Detergente', 2.0, 25),
  ];

  List<Produto> carrinho = [];

  print("Bem-vindo(a) ao mercadinho da Ellen!");
  print("Vamos às compras!?");
  print("Selecione um produto digitando o número correspondente:");
  for (int i = 0; i < produtos.length; i++) {
    print("${i + 1}. ${produtos[i].nome} - R\$ ${produtos[i].preco} - Qtd: ${produtos[i].quantidade}");
  }

  while (true) {
    int escolha = int.parse(stdin.readLineSync()!);
    if (escolha > 0 && escolha <= produtos.length) {
      Produto produto = produtos[escolha - 1];
      if (produto.quantidade > 0) {
        print("Quantos você deseja comprar?");
        int quantidade = int.parse(stdin.readLineSync()!);
        if (quantidade <= produto.quantidade) {
          carrinho.add(Produto(produto.nome, produto.preco, quantidade));
          produto.quantidade -= quantidade;
          print("Produto adicionado ao carrinho!");
        } else {
          print("Não há quantidade suficiente em estoque.");
        }
      } else {
        print("Produto esgotado.");
      }
    } else {
      print("Opção inválida.");
    }

    print("Deseja continuar comprando? (s/n)");
    String resposta = stdin.readLineSync()!;
    if (resposta.toLowerCase() == 'n') {
      break;
    }
  }

      double total = 0;
      for (Produto produto in carrinho) {
        total += produto.preco * produto.quantidade;
      }

  print("Total da compra: R\$ $total");

    print("Formas de pagamento:");
    print("1. Dinheiro");
    print("2. Cartão de crédito");
    print("3. Cartão de débito");
    print("4. Fiado");

    print("Escolha a forma de pagamento:");
    int formaPagamento = int.parse(stdin.readLineSync()!);

    double valorPago = 0;

    switch (formaPagamento) {
      case 1:
        print("Informe o valor em dinheiro:");
        valorPago = double.parse(stdin.readLineSync()!);
        if (valorPago >= total) {
          print("Pagamento realizado com sucesso!");
          print("Seu troco é R\$ ${valorPago - total}");
        } else {
          print("Você não tem dinheiro pra isso :(.");
        }
        break;
      case 2:
        print("Informe o valor a ser pago com cartão de crédito:");
        valorPago = double.parse(stdin.readLineSync()!);
        if (valorPago >= total) {
          print("Pagamento realizado com sucesso!");
        } else {
          print("Você não tem dinheiro pra isso :(.");
        }
        break;
      case 3:
        print("Informe o valor a ser pago com cartão de débito:");
        valorPago = double.parse(stdin.readLineSync()!);
        if (valorPago >= total) {
          print("Pagamento realizado com sucesso!");
        } else {
          print("Você não tem dinheiro pra isso :(.");
        }
        break;
      default:
        print("Forma de pagamento inválida.");
        break;
    }

    if (formaPagamento >= 1 && formaPagamento <= 3 && valorPago >= total) {
      print("Relatório da compra:");
      print("Produtos comprados:");
      for (Produto produto in carrinho) {
        print("${produto.nome} - R\$ ${produto.preco} x ${produto.quantidade} = R\$ ${produto.preco * produto.quantidade}");
      }
      print("Total: R\$ $total");
      print("Forma de pagamento: $formaPagamento");
      print("Valor pago: R\$ $valorPago");
      print("Obrigada pela compra!");
    }
  }
