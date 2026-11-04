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
// arktsid: lookahead_negative_06
// description: Negative lookahead (?! Disjunction) — /(\.(?!com|org)|\/)/.exec("ah.info") matches "." at index 2

function main(): void {
    let r: RegExp = new RegExp('(\\.(?!com|org)|\\/)');
    let m = r.exec('ah.info');
    arktest.assertTrue(m !== null);
    arktest.assertEQ(m!.length, 2);
    arktest.assertEQ(m!.index, 2);
    arktest.assertEQ(m!.input, 'ah.info');
    arktest.assertEQ(m![0], '.');
    arktest.assertEQ(m![1], '.');
}