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

// arktsid: functional_replace_global
// description: Function argument to String.prototype.replace gets groups as the last argument
// Conversion notes: ArkTS packs the JS 6-arg replacer into (substr, args) where
//   args = [captures..., offset(Double), str, groups]; groups is the last element,
//   preserving "groups as the last argument".

function main(): void {
    let source: String = '(?<fst>.)(?<snd>.)';
    let alternateSource: String = '(?<fst>.)|(?<snd>.)';

    for (let flags of ['g', 'gu']) {
        let i: int = 0;
        let re = new RegExp(source, flags);
        let result: String = 'abcd'.replace(re, (substr: String, args: (Object | undefined)[]): String => {
            let fst = args[0]!.toString();
            let snd = args[1]!.toString();
            let offset: double = (args[2] as Double).toDouble();
            let str = args[3]!.toString();
            let groups = args[4] as Record<String, String | undefined>;
            if (i == 0) {
                arktest.assertEQ(substr, 'ab', 'match 0');
                arktest.assertEQ(groups.get('fst'), 'a', 'groups.fst 0');
                arktest.assertEQ(groups.get('snd'), 'b', 'groups.snd 0');
                arktest.assertEQ(fst, 'a', 'fst 0');
                arktest.assertEQ(snd, 'b', 'snd 0');
                arktest.assertEQ(offset, 0.0, 'offset 0');
                arktest.assertEQ(str, 'abcd', 'str 0');
            } else if (i == 1) {
                arktest.assertEQ(substr, 'cd', 'match 1');
                arktest.assertEQ(groups.get('fst'), 'c', 'groups.fst 1');
                arktest.assertEQ(groups.get('snd'), 'd', 'groups.snd 1');
                arktest.assertEQ(fst, 'c', 'fst 1');
                arktest.assertEQ(snd, 'd', 'snd 1');
                arktest.assertEQ(offset, 2.0, 'offset 1');
                arktest.assertEQ(str, 'abcd', 'str 1');
            } else {
                arktest.assertTrue(false, 'unreachable');
            }
            i++;
            return groups.get('snd')! + groups.get('fst')!;
        });
        arktest.assertEQ(result, 'badc', 'result');
        arktest.assertEQ(i, 2, 'replacer called twice');

        let re2 = new RegExp(alternateSource, flags);
        arktest.assertEQ('undefinedundefinedundefinedundefined',
            'abcd'.replace(re2, (substr: String, args: (Object | undefined)[]): String => {
                let groups = args[4] as Record<String, String | undefined>;
                return groups.get('snd') ?? 'undefined';
            }), 'alternate groups.snd');
    }
}