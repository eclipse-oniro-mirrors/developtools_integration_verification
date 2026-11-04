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

class LegalPair {
  public codePoint: int;
  public encoded: string;

  constructor(codePoint: int, encoded: string) {
    this.codePoint = codePoint;
    this.encoded = encoded;
  }
}

function main(): void {
  let kLegalPairs: LegalPair[] = [
    new LegalPair(0x00, '%00'),
    new LegalPair(0x01, '%01'),
    new LegalPair(0x7f, '%7F'),
    new LegalPair(0x80, '%C2%80'),
    new LegalPair(0x81, '%C2%81'),
    new LegalPair(0x7ff, '%DF%BF'),
    new LegalPair(0x800, '%E0%A0%80'),
    new LegalPair(0x801, '%E0%A0%81'),
    new LegalPair(0xd7ff, '%ED%9F%BF'),
    new LegalPair(0xffff, '%EF%BF%BF')
  ];

  let kIllegalEncoded: string[] = [
    '%80', '%BF', '%80%BF', '%80%BF%80', '%C0%22', '%DF',
    '%EF%BF', '%F7BFBF', '%FE', '%FF', '%FE%FE%FF%FF',
    '%C0%AF', '%E0%9F%BF', '%F0%8F%BF%BF', '%C0%80',
    '%E0%80%80'
  ];

  for (let i: int = 0; i < kLegalPairs.length; i++) {
    let decoded: string = String.fromCharCode(kLegalPairs[i].codePoint);
    let encoded: string = kLegalPairs[i].encoded;
    arktest.assertEQ(decodeURI(encoded), decoded);
    arktest.assertEQ(encodeURI(decoded), encoded);
  }
  for (let i: int = 0; i < kIllegalEncoded.length; i++) {
    let value: string = kIllegalEncoded[i];
    let exception: boolean = false;
    try {
      decodeURI(value);
    } catch (e) {
      exception = true;
      arktest.assertTrue(e instanceof URIError);
    }
    arktest.assertTrue(exception);
  }
}
