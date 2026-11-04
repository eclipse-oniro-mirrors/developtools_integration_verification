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

// arktsid: reduceright_descending_order_strings
// description: Array.prototype.reduceRight reduces array in descending order of indices
// Conversion notes:
//  - Homogeneous string array ["1","2","3","4","5"], no initialValue; the
//    accumulator starts at the last element "5" and concatenates right-to-left:
//    "5"+"4"="54", +"3"="543", +"2"="5432", +"1"="54321".

function main(): void {
    let srcArr: string[] = ['1', '2', '3', '4', '5'];
    let r: string = srcArr.reduceRight((prev: string, cur: string): string => { return prev + cur; });
    arktest.assertEQ(r, '54321', 'srcArr.reduceRight(callbackfn)');
}