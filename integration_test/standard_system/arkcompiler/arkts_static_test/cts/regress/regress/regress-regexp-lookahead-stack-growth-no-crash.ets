/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

function main(): void {
  const regexp: RegExp = new RegExp(
    'GArkTools.gcy\\b[^D]*D((?:(?=([^G]+))\\2|G(?!ArkTools.gcy\\b[^D]*D))*?)' +
    'GIArkTools.gcyD'
  );

  const input: String = 'GArkTools.gcyDGArkTools.gcy.saaaa.aDGaaa.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaancaDGgnayr' +
    '.aryycnaaaataaaa.aryyacnaaataaaa.aaaaraaaaa.aaagaaaaaaaaDGgaaaaDGga' +
    '.aaagaaaaaaaaDGga.nyataaaaragraa.anyataaagaca.agayraaarataga.aaacaa' +
    '.aaagaa.aaacaaaDGaaa.aynaaaaaaaaacaaaaaArkTools.gcaaaaaacaagaa.agayraaaGgaaa' +
    '.trgaaaaaagaatGanyara.caagaaGaD.araaaa_aat_aayDDaaDGaaa.aynaaaaaaaa' +
    'acaaaaaArkTools.gcaaaaaacaaaaa.agayraaaGgaaa.trgaaaaaaatGanyaraDDaaDGacna.ay' +
    'naaaaaaaaacaaaaaArkTools.gcaaaaaacaaaraGgaaa.naaaaagaaaaaaraynaaGanyaraDDaaD' +
    'aGgaaa.saaangaaaaraaaGgaaa.trgaaaragaaaarGanyaraDDDaGIacnaDGIaaaDGI' +
    'aaaDGIgaDGga.anyataaagaca.agayraaaaagaa.aaaaa.cnaaaata.aca.aca.aca.' +
    'acaaaDGgnayr.aaaaraaaaa.aaagaaaaaaaaDGgaaaaDGgaDGga.aayacnaaaaa.ayn' +
    'aaaaaaaaacaaaaaArkTools.gcaaaaaanaraDGaDacaaaaag_anaraGIaDGIgaDGIgaDGgaDGga.' +
    'aayacnaaaaa.aaagaaaaaaaaDGaa.aaagaaaaaaaa.aaaraaaa.aaaanaraaaa.IDGI' +
    'gaDGIgaDGgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaa' +
    'a.trgGragaaaacgGaaaaaaaG_aaaaa_Gaaaaaaaaa,.aGanar.anaraDDaaGIgaDGga' +
    '.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.anyataaagacaDGaDaaaaag_caaaaag_an' +
    'araGIaDGIgaDGIgaDGgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaag' +
    'acaDaGgaaa.trgGragaaaacgGaaaaaaaG_aaaaa_aaaaaa,.aaaaacaDDaaGIgaDGga' +
    '.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.anyataaagacaDGaDataaac_araaaaGIaD' +
    'GIgaDGIgaDaaArkTools.gcyaaGgaDGga.aayacnaaaaa.aaagaaaaaaaaDGaa.aaagaaaaaaaa.' +
    'aaaraaaa.aaaanaraaaa.IDGIgaDGIgaDGArkTools.gcy.asaadanyaga.aa.aaaDGgaDGga.ay' +
    'naaaaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaa' +
    'aaaaaG_aaaaa_DaaaaGaa,.aDanyagaaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaa' +
    'aaaaanyara.anyataaagacaDGaDadanyagaaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaaga' +
    'cras.agra_yratga.aa.aaaarsaaraa.aa.agra_yratga.aa.aaaDGgaDGga.aynaa' +
    'aaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaa' +
    'aaG_aaaaa_aGaaaaaaGaa,.aaratgaaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaa' +
    'aaaanyara.anyataaagacaDGaDaagra_yratgaaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asa' +
    'agacras.aratag.aa.aaaarsaaraa.aa.aratag.aa.aaaDGgaDGga.aynaaaaaaaaa' +
    'caaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaaaaG_aaa' +
    'aa_aaaaaGa,.aaratagaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.a' +
    'nyataaagacaDGaDaaratagaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaagacras.gaaax_ar' +
    'atag.aa.aaaarsaaraa.aa.gaaax_aratag.aa.aaaDGgaDGga.aynaaaaaaaaacaaa' +
    'aaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaaaaG_aaaaa_G' +
    'aaaaaaaaaGa,.aaratagaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.' +
    'anyataaagacaDGaDagaaax_aratagaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaagacras.c' +
    'ag_aaar.aa.aaaarsaaraa.aa.cag_aaar.aa.aaaDGgaDGga.aynaaaaaaaaacaaaa' +
    'aArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaaaaG_aaaaa_aa' +
    'Gaaaaa,.aaagaaaraDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.anya' +
    'taaagacaDGaDacag_aaaraGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaagacras.aaggaata_' +
    'aa_cynaga_cc.aa.aaaarsaaraa.aa.aaggaata_aa_cynaga_cc.aa.aaaDGgaDGga' +
    '.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacg' +
    'GaaaaaaaG_aaaaa_aaGGaaaa_aa_aaaaGa_aaa,.aaynagaIcagaDDaaGIgaDGga.ay' +
    'naaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.anyataaagacaDGaDaaaggaata_aa_cynaga_' +
    'ccaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaagacras.syaara_aanargra.aa.aaaarsaar' +
    'aa.aa.syaara_aanargra.aa.aaaDGgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaraa' +
    'aa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaaaaG_aaaaa_aaaaaaaaaaaGaaa' +
    ',.aaanargraaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaanyara.anyataaag' +
    'acaDGaDasyaara_aanargraaGIaDGIgaDGIgaDGIArkTools.gcyDGArkTools.gcy.asaagacras.cynag_a' +
    'anargra.aa.aaaarsaaraa.aa.cynag_aanargra.aa.aaaDGgaDGga.aynaaaaaaaa' +
    'acaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaacgGaaaaaaaG_aa' +
    'aaa_aaaaGaaaaaGaaa,.aaanargraaDDaaGIgaDGga.aynaaaaaaaaacaaaaaArkTools.gcaaaa' +
    'aaanyara.anyataaagacaDGaDacynag_aanargraaGIaDGIgaDGIgaDGIArkTools.gcyDGgaDGg' +
    'a.aynaaaaaaaaacaaaaaArkTools.gcaaaaaaaraaaa.anyataaagacaDaGgaaa.trgGragaaaac' +
    'gGaaaaaaaG';

  const result: boolean = regexp.test(input);
  arktest.assertTrue(result);
}
