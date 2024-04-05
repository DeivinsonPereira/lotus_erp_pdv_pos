import 'dart:async';
import 'dart:convert';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_simple_bluetooth_printer/flutter_simple_bluetooth_printer.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../repositories/isar_db/isar_service.dart';
import '../services/format_numbers.dart';
import '../services/dependencies.dart';
import '../services/print_string.dart/print_normal_strings.dart';

class PrinterController extends GetxController {
  var bluetoothManager = FlutterSimpleBluetoothPrinter.instance;
  var devices = <BluetoothDevice>[].obs;
  final isScanning = false.obs;
  var isConnected = true.obs;
  StreamSubscription<BTConnectState>? subscriptionBtStatus;
  BTConnectState currentStatus = BTConnectState.disconnect;

  BluetoothDevice? selectedPrinter;

  IsarService service = IsarService();
  Logger logger = Logger();

  var configController = Dependencies.configController();
  var printerSize = '';

  void setPrinterSize() {
    printerSize = configController.sizePrinter.value;
  }

  //faz uma impressão teste
  Future<void> print2X1Test() async {
    if (printerSize == '58mm') {
      String teste = "\n\nVista Tecnologia\n\n\n";
      teste += "teste 123\n\n\n\n\n\n\n\n\n";

      PrintNormalStrings().imprimirTeste(texto: teste);
    }
  }
/*
  //faz impressão da abertura do caixa (caso o valor seja superior a 0);
  Future<void> printOpenRegister(caixa_item caixaItem) async {
    SideBarController sideBarController = Dependencies.sidebarController();
    GlobalController globalController = Dependencies.globalController();

    //variáveis para montagem da impressão
    String nomeEmpresa = '';
    String ruaEmpresa = '';
    String numeroEmpresa = '';
    String bairroEmpresa = '';

    const typeMovimentation = 'ABERTURA DO CAIXA';

    var name = 'LOTUS ERP PDV:';
    var data = sideBarController.dateNowFormated.value;
    var hour = sideBarController.hours.value;

    //variaveis referente à caixaItem
    String registro = caixaItem.id.toString();
    var datatransacao = sideBarController.dateNowFormated.value;
    String horaTransacao = caixaItem.hora;
    String descricao = typeMovimentation;

    String valorCre = FormatNumbers.formatNumbertoString(caixaItem.valor_cre);
    String valorDeb = FormatNumbers.formatNumbertoString(caixaItem.valor_deb);
    String forma = '';

    //variaveis referente a Caixa
    int idCaixa = 0;
    var usuario = '';
    String? abertura = '';

    //busca dados da empresa para alimentar as variaveis de impressão
    empresa? dataEmpresa = await service.searchEmpresa();

    if (dataEmpresa != null) {
      nomeEmpresa = dataEmpresa.fantasia ?? '';
      ruaEmpresa = dataEmpresa.endereco ?? '';
      numeroEmpresa = dataEmpresa.numero ?? '';
      bairroEmpresa = dataEmpresa.bairro ?? '';
    }

    tipo_recebimento? tipoPagto =
        await service.search_tipoRecebimento(caixaItem.id_tipo_recebimento);

    if (tipoPagto != null) {
      forma = tipoPagto.descricao ?? '';
    }
    globalController.setIdUsuario();
    caixa? dataCaixa =
        await service.getCaixaWithIdUser(globalController.userId);
    usuario_logado? us = await service.getUserLogged();

    idCaixa = dataCaixa?.id_caixa ?? 0;
    usuario = us?.login ?? '';
    abertura = DatetimeFormatterWidget.formatDate(
        dataCaixa?.abertura_data ?? DateTime.now());

    if (printerSize == '80mm') {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm80, profile);
      List<int> bytes = [];

      if (selectedPrinter == null) return;

      try {
        await connectDevice();
        if (!isConnected.value) return;

        bytes += generator.text(nomeEmpresa,
            styles: const PosStyles(align: PosAlign.left, bold: true));
        bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
        bytes += generator.text(bairroEmpresa);
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text(typeMovimentation,
            styles: const PosStyles(
                align: PosAlign.left, bold: true, width: PosTextSize.size2));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('$name $data - $hour',
            styles: const PosStyles(align: PosAlign.left));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('Registro: $registro');
        bytes += generator.text('Data: $datatransacao $horaTransacao');
        bytes += generator.text('Descricao: $descricao',
            styles: const PosStyles(codeTable: 'CP1252'));
        bytes += generator.text('');
        bytes += generator.text('Valor CRE: $valorCre');
        bytes += generator.text('Valor DEB: $valorDeb');
        bytes += generator.text('Forma: $forma');
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('ID Caixa: $idCaixa');
        bytes += generator.text('Usuario: $usuario',
            styles: const PosStyles(codeTable: 'CP1252'));
        bytes += generator.text('Abertura: $abertura');
        bytes += generator.text(
            '________________________________________________\n\n\n',
            styles: const PosStyles(bold: true));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('CONFERIDO POR: ');
        bytes += generator.text('\n\n');

        print('A impressão está comentada');
        String textToPrint = String.fromCharCodes(bytes);
        await bluetoothManager.writeText(textToPrint);
      } on BTException {
        return;
      }
    }
    if (printerSize == '58mm') {
      try {
        String text1 = nomeEmpresa; // bold

        String text2 = '\n$ruaEmpresa, $numeroEmpresa\n'; // normal
        text2 += bairroEmpresa;

        String text3 = '\n_______________________________\n'; // negrito
        text3 += typeMovimentation; // negrito tamanho 2
        text3 += '\n_______________________________\n';

        String text4 = '$name $data\n$hour'; // normal

        String text5 = '\n_______________________________\n'; // negrito

        String text6 = 'Registro: $registro\n'; // normal
        text6 += 'Data: $datatransacao $horaTransacao\n';
        text6 += 'Descricao: $descricao\n\n';
        text6 += 'Valor CRE: $valorCre\n';
        text6 += 'Valor DEB: $valorDeb\n';
        text6 += 'Forma: $forma';

        String text7 = '\n_______________________________\n'; // negrito

        String text8 = 'ID Caixa: $idCaixa\n'; // normal
        text8 += 'Usuario: $usuario\n';
        text8 += 'Abertura: $abertura';

        String text9 = '\n_______________________________\n\n\n\n'; // negrito
        text9 += 'CONFERIDO POR: \n\n\n\n\n\n';

        PrintNormalStrings().imprimirOpenRegister(
            text1, text2, text3, text4, text5, text6, text7, text8, text9);
      } catch (e) {
        logger.e('erro ao imprimir 58mm: $e');
      }
    }
  }

  //faz impressão da movimentação do caixa
  Future<void> printMovimentationCaixa(caixa_item caixaItem, int userId) async {
    SideBarController sideBarController = Dependencies.sidebarController();
    GlobalController globalController = Dependencies.globalController();

    //variáveis para montagem da impressão
    String nomeEmpresa = '';
    String ruaEmpresa = '';
    String numeroEmpresa = '';
    String bairroEmpresa = '';

    const typeMovimentation = 'MOVIMENTACAO CAIXA';

    var name = 'LOTUS ERP PDV:';
    var data = sideBarController.dateNowFormated.value;
    var hour = sideBarController.hours.value;

    //variaveis referente à caixaItem
    String registro = caixaItem.id.toString();
    var datatransacao = sideBarController.dateNowFormated.value;
    String horaTransacao = caixaItem.hora;
    String descricao = caixaItem.descricao!;

    String valorCre = FormatNumbers.formatNumbertoString(caixaItem.valor_cre);
    String valorDeb = FormatNumbers.formatNumbertoString(caixaItem.valor_deb);
    String forma = '';

    //variaveis referente a Caixa
    int? idCaixa = 0;
    var usuario = '';
    String? abertura = '';

    //busca dados da empresa para alimentar as variaveis de impressão
    empresa? dataEmpresa = await service.searchEmpresa();

    if (dataEmpresa != null) {
      nomeEmpresa = dataEmpresa.fantasia ?? '';
      ruaEmpresa = dataEmpresa.endereco ?? '';
      numeroEmpresa = dataEmpresa.numero ?? '';
      bairroEmpresa = dataEmpresa.bairro ?? '';
    }

    tipo_recebimento? tipoPagto =
        await service.search_tipoRecebimento(caixaItem.id_tipo_recebimento);

    if (tipoPagto != null) {
      forma = tipoPagto.descricao ?? '';
    }
    await globalController.setIdUsuario();
    caixa? dataCaixa = await service.getCaixaWithIdUser(userId);
    usuario_logado? us = await service.getUserLogged();

    idCaixa = await service.getCaixaIdWithIdUserAndStatus0();
    usuario = us?.login ?? '';
    abertura = DatetimeFormatterWidget.formatDate(dataCaixa!.abertura_data);

    if (printerSize == '80mm') {
      try {
        final profile = await CapabilityProfile.load();
        final generator = Generator(PaperSize.mm80, profile);
        List<int> bytes = [];
        if (selectedPrinter == null) return;
        await connectDevice();
        if (!isConnected.value) return;
        bytes += generator.text(nomeEmpresa,
            styles: const PosStyles(align: PosAlign.left, bold: true));
        bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
        bytes += generator.text(bairroEmpresa);
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text(typeMovimentation,
            styles: const PosStyles(
                align: PosAlign.left, bold: true, width: PosTextSize.size2));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('$name $data - $hour',
            styles: const PosStyles(align: PosAlign.left));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('Registro: $registro');
        bytes += generator.text('Data: $datatransacao $horaTransacao');
        bytes += generator.text('Descricao: $descricao',
            styles: const PosStyles(codeTable: 'CP1252'));
        bytes += generator.text('');
        bytes += generator.text('Valor CRE: $valorCre');
        bytes += generator.text('Valor DEB: $valorDeb');
        bytes += generator.text('Forma: $forma');
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('ID Caixa: $idCaixa');
        bytes += generator.text('Usuario: $usuario',
            styles: const PosStyles(codeTable: 'CP1252'));
        bytes += generator.text('Abertura: $abertura');
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text(
            '\n\n________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('CONFERIDO POR: ');
        bytes += generator.text('\n\n');

        print('A impressão da movimentação de caixa está comentada');
        String textToPrint = String.fromCharCodes(bytes);
        await bluetoothManager.writeText(textToPrint);
      } on BTException {
        return;
      }
    } else if (printerSize == '58mm') {
      try {
        String text1 = nomeEmpresa; // bold

        String text2 = '\n$ruaEmpresa, $numeroEmpresa\n'; // normal
        text2 += bairroEmpresa;

        String text3 = '\n_______________________________\n'; // negrito
        text3 += typeMovimentation; // negrito tamanho 2
        text3 += '\n_______________________________\n';

        String text4 = '$name $data\n$hour'; // normal

        String text5 = '\n_______________________________\n'; // negrito

        String text6 = 'Registro: $registro\n'; // normal
        text6 += 'Data: $datatransacao $horaTransacao\n';
        text6 += 'Descricao: $descricao\n\n';
        text6 += 'Valor CRE: $valorCre\n';
        text6 += 'Valor DEB: $valorDeb\n';
        text6 += 'Forma: $forma';

        String text7 = '\n_______________________________\n'; // negrito

        String text8 = 'ID Caixa: $idCaixa\n'; // normal
        text8 += 'Usuario: $usuario\n';
        text8 += 'Abertura: $abertura';

        String text9 = '\n_______________________________\n\n\n\n'; // negrito
        text9 += 'CONFERIDO POR: \n\n\n\n\n\n';

        PrintNormalStrings().imprimirMovimentRegister(
            text1, text2, text3, text4, text5, text6, text7, text8, text9);
      } catch (e) {
        logger.e('Erro ao imprimir 58mm $e');
      }
    }
  }

  //Faz a impressão do fechamento do caixa
  Future<void> printCloseCaixa(List<caixa_fechamento> fechamento) async {
    SideBarController sideBarController = Dependencies.sidebarController();
    printerSize = configController.tamanhoImpressora.value;
    Dependencies.globalController();

    //variáveis para montagem da impressão
    String nomeEmpresa = '';
    String ruaEmpresa = '';
    String numeroEmpresa = '';
    String bairroEmpresa = '';

    const typeMovimentation = 'PRE-FECHAMENTO CAIXA';

    var name = 'LOTUS ERP PDV:';
    var data = sideBarController.dateNowFormated.value;
    var hour = sideBarController.hours.value;

    //variaveis referente a Caixa
    int? idCaixa = 0;
    var usuario = '';
    String? abertura = '';

    //busca dados da empresa para alimentar as variaveis de impressão
    empresa? dataEmpresa = await service.searchEmpresa();

    if (dataEmpresa != null) {
      nomeEmpresa = dataEmpresa.fantasia ?? '';
      ruaEmpresa = dataEmpresa.endereco ?? '';
      numeroEmpresa = dataEmpresa.numero ?? '';
      bairroEmpresa = dataEmpresa.bairro ?? '';
    }
    usuario_logado? us = await service.getUserLogged();

    idCaixa = await service.getCaixaIdWithIdUserAndStatus0();
    usuario = us?.login ?? '';
    var caixaObjeto = await service.getCaixaWithIdUserAndStatus0();
    abertura = DatetimeFormatterWidget.formatDate(caixaObjeto!.abertura_data);
    caixa? aberturaCaixaItemValue = await service.getCaixaItemValue();

    double totalInformado = 0.0;
    var descricao = 'Descricao';
    var informado = 'Informado';
    var totalGrupo = 'Total Grupo';

    int numeroCaracteres1 =
        printerSize == '58mm' ? 15 - descricao.length : 23 - descricao.length;
    int numeroCaracteres2 =
        printerSize == '58mm' ? 15 - descricao.length : 23 - informado.length;

    int numeroCaracteresTotGrupo = 23 - totalGrupo.length;

    var tipoPagto = [];
    for (int i = 0; i < fechamento.length; i++) {
      totalInformado += fechamento[i].valor_informado!;

      tipo_recebimento? tipos = await service
          .search_tipoRecebimento(fechamento[i].id_tipo_recebimento);
      tipoPagto.add(tipos!.descricao);
    }
    /*  String totalInformadoStr = totalInformado;*/
    /*String testeImpressao = '';*/

    //formatação da impressão

    if (printerSize == '80mm') {
      try {
        final profile = await CapabilityProfile.load();
        final generator = Generator(
          PaperSize.mm80,
          profile,
        );

        List<int> bytes = [];

        if (selectedPrinter == null) return;

        await connectDevice();
        if (!isConnected.value) return;

        bytes += generator.text(nomeEmpresa,
            styles: const PosStyles(align: PosAlign.left, bold: true));
        bytes += generator.text('$ruaEmpresa, $numeroEmpresa');
        bytes += generator.text(bairroEmpresa);
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text(typeMovimentation,
            styles: const PosStyles(
                align: PosAlign.left, bold: true, width: PosTextSize.size2));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes += generator.text('$name $data - $hour',
            styles: const PosStyles(align: PosAlign.left));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        //
        //
        bytes +=
            generator.text('ABERTURA', styles: const PosStyles(bold: true));
        bytes += generator.text('ID Caixa: $idCaixa');
        bytes += generator.text('Usuario: $usuario',
            styles: const PosStyles(codeTable: 'CP1252'));
        bytes += generator.text('Abertura: $abertura');
        bytes += generator.text(
          'Valor:           ${formatoBrasileiro.format(aberturaCaixaItemValue?.abertura_valor)}',
        );
        //
        //
        bytes += generator.text('\nRESUMO MOVIMENTACAO',
            styles: const PosStyles(bold: true));
        bytes += generator.text(
            'Descricao${''.padRight(numeroCaracteres1)}${''.padLeft(numeroCaracteres2)}Informado',
            styles: const PosStyles(bold: true));

        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        //
        //
        for (var i = 0; i < fechamento.length; i++) {
          var informado =
              formatoBrasileiro.format(fechamento[i].valor_informado);

          int numeroCaracteres1 = 23 - tipoPagto[i].toString().length;
          int numeroCaracteres2 = 23 - informado.length;

          bytes += generator.text(tipoPagto[i] +
              ''.padRight(numeroCaracteres1) +
              ''.padLeft(numeroCaracteres2) +
              formatoBrasileiro.format(fechamento[i].valor_informado));
        }

        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));

        int totInformado = 23 - formatoBrasileiro.format(totalInformado).length;
        bytes += generator.text(
            totalGrupo +
                ''.padRight(numeroCaracteresTotGrupo) +
                ''.padLeft(totInformado) +
                formatoBrasileiro.format(totalInformado),
            styles: const PosStyles(bold: true));
        bytes += generator.text(
            '________________________________________________\n\n',
            styles: const PosStyles(bold: true));
        bytes += generator.text(
            '________________________________________________',
            styles: const PosStyles(bold: true));
        bytes +=
            generator.text('FECHAMENTO', styles: const PosStyles(bold: true));
        bytes += generator.text('      Data:');
        bytes += generator.text('\n');
        bytes += generator.text('CONFERIDO EM: ___/___/_______');
        bytes +=
            generator.text('  CONFERENTE: _______________________________\n\n');
        bytes += generator.cut();
        print('A impressão do fechamento de caixa está comentada');

        String textToPrint = String.fromCharCodes(bytes);
        await bluetoothManager.writeText(textToPrint);
      } on BTException {
        return;
      }
    } else if (printerSize == '58mm') {
      String text1 = nomeEmpresa; // bold

      String text2 = '\n$ruaEmpresa, $numeroEmpresa\n'; // normal
      text2 += bairroEmpresa;

      String text3 = '\n_______________________________\n'; // negrito
      text3 += typeMovimentation; // negrito tamanho 2
      text3 += '\n_______________________________\n';

      String text4 = '$name $data\n$hour'; // normal

      String text5 = '\n_______________________________\n'; // negrito
      //
      //

      String text6 = 'ABERTURA\n'; // negrito

      String text7 = 'ID Caixa: $idCaixa\n';
      text7 += 'Usuario: $usuario\n';
      text7 += 'Abertura: $abertura\n';
      text7 += 'Valor:';

      String text8 =
          'Valor:        ${formatoBrasileiro.format(aberturaCaixaItemValue?.abertura_valor)}'; // direita
      //
      //
      String text9 = '\nRESUMO MOVIMENTACAO\n'; // negrito

      String text10 =
          'Descricao${''.padRight(numeroCaracteres1)}${''.padLeft(numeroCaracteres2)}Informado'; // direita e negrito

      String text11 = '\n_______________________________\n'; // negrito
      //
      //
      List<String> text12 = [''];
      List<String> text13 = [''];
      for (var i = 0; i < fechamento.length; i++) {
        text12.add(tipoPagto[i] + '\n');
        text13.add(
            '${formatoBrasileiro.format(fechamento[i].valor_informado)}\n');
      }

      String text14 = '\n_______________________________\n'; // negrito

      String text15 = 'Total Informado:\n';
      String text16 =
          '               ${formatoBrasileiro.format(totalInformado)}';

      String text17 = '\n_______________________________\n\n\n'; // negrito
      text17 += 'FECHAMENTO\n';

      String text18 = 'Data:\n';
      text18 += 'CONFERIDO EM: ___/___/______/\n\n\n';
      text18 += 'CONFERENTE: _________________\n\n\n\n\n\n';

      PrintNormalStrings().imprimirCloseRegister(
          text1,
          text2,
          text3,
          text4,
          text5,
          text6,
          text7,
          text8,
          text9,
          text10,
          text11,
          text12,
          text13,
          text14,
          text15,
          text16,
          text17,
          text18);
    }

    /*print(
          '$text1, $text2, $text3, $text4, $text5, $text6, $text7, $text8, $text9, $text10, $text11, $text12, $text14, $text15, $text17, $text18');
    }*/
  }

  //Faz a impressão (espelho) da venda
  Future<void> printVendas(venda venda, List<venda_item> vendaItens) async {
    SideBarController sideBarController = Dependencies.sidebarController();
    Dependencies.globalController();

    final profile = await CapabilityProfile.load();
    final generator = Generator(
      PaperSize.mm80,
      profile,
    );

    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      //variáveis para montagem da impressão
      String idEmpresa = '';
      String nomeEmpresa = '';

      const typeMovimentation = 'ESPELHO DE CONFERENCIA';

      var name = 'LOTUS ERP PDV:';
      var data = sideBarController.dateNowFormated.value;
      var hour = sideBarController.hours.value;

      //variaveis referente a Caixa

      //busca dados da empresa para alimentar as variaveis de impressão
      empresa? dataEmpresa = await service.searchEmpresa();

      if (dataEmpresa != null) {
        idEmpresa = dataEmpresa.id.toString().padLeft(6, '0').substring(0, 6);
        nomeEmpresa = dataEmpresa.fantasia ?? '';
      }

      //formatação da impressão
      bytes += generator.text('$name $data - $hour',
          styles: const PosStyles(align: PosAlign.left));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes += generator.text(typeMovimentation,
          styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text('          DOCUMENTO SEM VALOR FISCAL',
          styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes += generator.text(nomeEmpresa,
          styles: const PosStyles(align: PosAlign.left, bold: true));
      bytes += generator.text('Empresa: $idEmpresa');
      bytes += generator.text(
          'Id Registro:${venda.id_venda.toString().padLeft(6, '0').substring(0, 6)}');
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));
      bytes += generator.text('ITEM  Descricao');
      bytes += generator.text(
          '${''.padRight(10)}Qtde${''.padRight(10)}Unitario${''.padRight(10)}Total');
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      for (var i = 0; i < vendaItens.length; i++) {
        produto? produtos =
            await service.searchProdutoById(vendaItens[i].id_produto);

        String itemText =
            '${(i + 1).toString().padLeft(3, '0').substring(0, 3)} ${vendaItens[i].id} ${produtos!.descricao}';
        if (itemText.length > 48) {
          itemText =
              '${itemText.substring(0, 45)}...'; // Trunca o texto com '...'
        }
        bytes += generator.text(itemText, maxCharsPerLine: 48);

        var produtoslenght =
            14 - formatoBrasileiro.format(produtos.pvenda).length;
        var venda =
            20 - formatoBrasileiro.format(vendaItens[i].tot_bruto).length;
        var qtde = 13 - vendaItens[i].qtde.toString().length;

        bytes += generator.text(
            '${''.padRight(qtde)}${vendaItens[i].qtde}${''.padRight(produtoslenght)}${formatoBrasileiro.format(produtos.pvenda)}${''.padRight(venda)}${formatoBrasileiro.format(vendaItens[i].tot_bruto)}');
      }
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      int lengthTotBruto = 37 - 'Total Bruto(=):'.length;
      int lenghtDescontos =
          22 - formatoBrasileiro.format(venda.tot_desc_vlr).length;
      int lenghtTotalLiquido = 37 - 'Total Liquido(=):'.length;
      int lenghtInformado = 27 -
          formatoBrasileiro
              .format(venda.tot_liquido + venda.valor_troco)
              .length;
      int lenghtTroco = 38 - formatoBrasileiro.format(venda.valor_troco).length;

      int lenghtTotBruto =
          10 - formatoBrasileiro.format(venda.tot_bruto).length;
      int lenghtDescontosPercent =
          10 - venda.tot_desc_prc.toStringAsFixed(2).length;
      int lenghtTotLiquido =
          10 - formatoBrasileiro.format(venda.tot_liquido).length;

      String valueInformado =
          formatoBrasileiro.format(venda.tot_liquido + venda.valor_troco);

      int lenghtValorInformado = 7 - valueInformado.length;

      lenghtValorInformado += formatoBrasileiro
          .format(venda.tot_liquido + venda.valor_troco)
          .length;

      bytes += generator.text(
          'Total Bruto(=):${''.padRight(lengthTotBruto)}${''.padLeft(lenghtTotBruto)}${formatoBrasileiro.format(venda.tot_bruto)}',
          styles: const PosStyles(bold: true));

      bytes += generator.text(
        'Descontos(-):${''.padRight(lenghtDescontosPercent)} %${venda.tot_desc_prc.toStringAsFixed(2)}${''.padRight(lenghtDescontos)}${formatoBrasileiro.format(venda.tot_desc_vlr)}',
      );

      bytes += generator.text(
          'Total Liquido(=):${''.padRight(lenghtTotalLiquido)}${''.padLeft(lenghtTotLiquido)}${formatoBrasileiro.format(venda.tot_liquido)}',
          styles: const PosStyles(bold: true));
      bytes += generator.text(
          '________________________________________________',
          styles: const PosStyles(bold: true));

      bytes += generator.text(
          'Informado(=):${''.padRight(lenghtInformado)}${''.padLeft(lenghtValorInformado)}${formatoBrasileiro.format(venda.tot_liquido + venda.valor_troco)}',
          styles: const PosStyles(bold: true));

      bytes += generator.text(
          'Troco(=):${''.padLeft(lenghtTroco)}${formatoBrasileiro.format(venda.valor_troco)}',
          styles: const PosStyles(bold: true));

      bytes +=
          generator.text('________________________________________________');

      bytes += generator.cut();

      print('A impressão da venda de caixa está comentada');
//      String textToPrint = String.fromCharCodes(bytes);
//      await bluetoothManager.writeText(textToPrint);
    } on BTException {
      return;
    }
  }

  //Faz a impressão das transações de cartão
  Future<void> printTransactionCard(String result) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(
      PaperSize.mm80,
      profile,
    );

    List<int> bytes = [];
    String viaCliente = '';
    String viaEstabelecimento = '';

    if (result.isNotEmpty) {
      Map<String, dynamic> data = jsonDecode(result);

      viaCliente = data['VIA_CLIENTE'];
      viaEstabelecimento = data['VIA_ESTABELECIMENTO'];
    }

    if (printerSize == '80mm') {
      try {
        await connectDevice();
        if (!isConnected.value) return;

        bytes += generator.text("Via do Cliente:\n$viaCliente");
        bytes += generator.cut();
        bytes += generator.text("Via do Estabelecimento:\n$viaEstabelecimento");
        bytes += generator.cut();

        //print('A impressão da transação está comentada');
        String textToPrint = String.fromCharCodes(bytes);
        await bluetoothManager.writeText(textToPrint);

        //formatação da impressão
        bytes += generator.text(result); //FIX: TALVEZ NÂO PRECISA - VERIFICAR
      } on BTException {
        return;
      }
    }
    if (printerSize == '58mm') {
      try {
        String cliente = '$viaCliente\n\n\n\n';
        String estabelecimento = '$viaEstabelecimento\n\n\n\n';
        await TefElginPrintService.imprimirPagamentoTEF(cliente);
        await Get.dialog(barrierDismissible: false,
            CustomDialogHighlightPaper(function: () async {
          Get.back();
          await Future.delayed(const Duration(seconds: 1));
          await TefElginPrintService.imprimirPagamentoTEF(estabelecimento);
        }));
      } catch (e) {
        logger.e("Erro ao chamar o método da plataforma: '$e'.");
        return;
      }
    }
  }

  //Faz a impressão das transações de cartão
  Future<void> printSegundaVia(String imagemComprovante) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(
      PaperSize.mm80,
      profile,
    );

    List<int> bytes = [];

    if (selectedPrinter == null) return;

    try {
      await connectDevice();
      if (!isConnected.value) return;

      Map<String, dynamic> data = jsonDecode(imagemComprovante);

      String viaCliente = data['VIA_CLIENTE'];
      String viaEstabelecimento = data['VIA_ESTABELECIMENTO'];

      bytes += generator.text("Via do Cliente:\n$viaCliente");
      bytes += generator.cut();
      bytes += generator.text("Via do Estabelecimento:\n$viaEstabelecimento");
      bytes += generator.cut();

      print('A impressão da segunda via está comentada');
//      String textToPrint = String.fromCharCodes(bytes);
//      await bluetoothManager.writeText(textToPrint);
    } on BTException {
      return;
    }
  }*/
}