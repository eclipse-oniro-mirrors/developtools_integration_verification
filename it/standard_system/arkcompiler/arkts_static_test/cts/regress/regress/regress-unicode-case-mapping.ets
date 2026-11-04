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
  // German eszett
  arktest.assertEQ('FRIEDRICHSTRASSE 14', 'friedrichstra\xDFe 14'.toUpperCase());
  arktest.assertEQ('XXSSSSSSXX', 'xx\xDF\xDF\xDFxx'.toUpperCase());
  arktest.assertEQ('(SS)', '(\xDF)'.toUpperCase());
  arktest.assertEQ('SS', '\xDF'.toUpperCase());

  // Turkish dotted upper-case I lower-case converts to two characters
  arktest.assertEQ('i\u0307', '\u0130'.toLowerCase());
  arktest.assertEQ('(i\u0307)', '(\u0130)'.toLowerCase());
  arktest.assertEQ('xxi\u0307xx', 'XX\u0130XX'.toLowerCase());

  // Greek small upsilon with dialytika and tonos upper-case converts to three
  // characters
  arktest.assertEQ('\u03A5\u0308\u0301', '\u03B0'.toUpperCase());
  arktest.assertEQ('(\u03A5\u0308\u0301)', '(\u03B0)'.toUpperCase());
  arktest.assertEQ('XX\u03A5\u0308\u0301XX', 'xx\u03B0xx'.toUpperCase());
}
