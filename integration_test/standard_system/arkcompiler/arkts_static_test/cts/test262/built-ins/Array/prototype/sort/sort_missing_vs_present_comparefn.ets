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

// arktsid: sort_missing_vs_present_comparefn
// description: Even with a user-supplied comparefn, a missing/undefined element is
//   handled by SortCompare (return 1 / -1) before the comparefn is invoked, so the
//   undefined slot still sorts to the end.
// Conversion notes:
//  - Source used new Array(2) then x[1] = 1 (a hole plus a value). ArkTS arrays are
//    dense, so the hole is expressed as an explicit undefined element. Per the ES
//    sort algorithm undefined is compared before the comparefn is called, so the
//    custom comparefn (which would otherwise prefer undefined first) is not reached.

function main(): void {
    let myComparefn = (x: number | undefined, y: number | undefined): int => {
        if (x === undefined) {
            return -1;
        }
        if (y === undefined) {
            return 1;
        }
        return 0;
    };

    let x: (number | undefined)[] = [undefined, 1];
    x.sort(myComparefn);
    arktest.assertEQ(x.length, 2, 'case 1: x.length === 2');
    arktest.assertTrue(x[0] === 1, 'case 1: x[0] === 1');
    arktest.assertTrue(x[1] === undefined, 'case 1: x[1] === undefined');

    let y: (number | undefined)[] = [1, undefined];
    y.sort(myComparefn);
    arktest.assertEQ(y.length, 2, 'case 2: y.length === 2');
    arktest.assertTrue(y[0] === 1, 'case 2: y[0] === 1');
    arktest.assertTrue(y[1] === undefined, 'case 2: y[1] === undefined');
}