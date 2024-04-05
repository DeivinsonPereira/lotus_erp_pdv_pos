// ignore_for_file: constant_identifier_names

enum TypesFormPayment {
  DINHEIRO(0),
  CHEQUE(1),
  CARTAO_CREDITO(2),
  CARTAO_DEBITO(3),
  CREDITO_CLIENTE(4),
  CREDIARIO(5),
  BANCO(6),
  TICKET(7),
  OUTROS(8),
  CONVENIO(9),
  PIX(10),
  DEPOSITO_BANCARIO(10);

  final int value;

  const TypesFormPayment(this.value);

}
