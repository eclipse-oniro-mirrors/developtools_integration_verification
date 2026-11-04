/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: functional_replace_non_global
// description: Function argument to String.prototype.replace gets groups as the last argument
// Conversion notes: non-global RegExp replace invokes the replacer exactly once.

function main(): void {
    let source: String = '(?<fst>.)(?<snd>.)';
    let alternateSource: String = '(?<fst>.)|(?<snd>.)';

    for (let flags of ['', 'u']) {
        let calls: int = 0;
        let re = new RegExp(source, flags);
        let result: String = 'abcd'.replace(re,
            (substr: String, args: (Object | undefined)[]): String => {
            calls++;
            arktest.assertEQ(substr, 'ab', 'match');
            arktest.assertEQ(args[0] as String, 'a', 'fst');
            arktest.assertEQ(args[1] as String, 'b', 'snd');
            arktest.assertEQ((args[2] as Double).toDouble(), 0.0, 'offset');
            arktest.assertEQ(args[3] as String, 'abcd', 'str');
            let groups: Record<String, String | undefined> =
                args[4] as Record<String, String | undefined>;
            arktest.assertEQ(groups.get('fst')!, 'a', 'groups.fst');
            arktest.assertEQ(groups.get('snd')!, 'b', 'groups.snd');
            return groups.get('snd')! + groups.get('fst')!;
        });
        arktest.assertEQ(result, 'bacd', 'result');
        arktest.assertEQ(calls, 1, 'calls once');

        let re2 = new RegExp(alternateSource, flags);
        let result2: String = 'abcd'.replace(re2,
            (substr: String, args: (Object | undefined)[]): String => {
            let groups: Record<String, String | undefined> =
                args[args.length - 1] as Record<String, String | undefined>;
            let snd: String | undefined = groups.get('snd');
            return snd === undefined ? 'undefined' : snd;
        });
        arktest.assertEQ(result2, 'undefinedbcd', 'alternate result');
    }
}