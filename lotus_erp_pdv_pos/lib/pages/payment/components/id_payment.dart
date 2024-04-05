// ignore_for_file: constant_identifier_names

enum IdPayment {
  POS_CARTAO_DEBITO(18),
  TICKET(22),
  DINHEIRO(1),
  POS_VOUCHER(103),
  POS_CARTAO_CREDITO(17),
  TEF_DEBITO(104),
  TEF_CREDITO(105),
  TEF_PIX(106),
  TEF_VOUCHER(107);

  final int value;

  const IdPayment(this.value);
}
