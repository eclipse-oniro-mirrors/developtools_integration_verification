/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: reduceright_descending_order_strings_initialvalue
// description: Array.prototype.reduceRight reduces array in descending order of indices (initialvalue present)
// Conversion notes:
//  - Homogeneous string array ["1","2","3","4","5"] with initialValue "6";
//    concatenates right-to-left: "6"+"5"="65", +"4"="654", +"3"="6543",
//    +"2"="65432", +"1"="654321". U == T == string.

function main(): void {
    let srcArr: string[] = ['1', '2', '3', '4', '5'];
    let r: string = srcArr.reduceRight<string>((prev: string, cur: string): string => { return prev + cur; }, '6');
    arktest.assertEQ(r, '654321', 'srcArr.reduceRight(callbackfn, "6")');
}