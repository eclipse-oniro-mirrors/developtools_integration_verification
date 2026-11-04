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
// arktsid: lookahead_negative_02
// description: Negative lookahead (?! Disjunction) - /Java(?!Script)([A-Z]\w*)/.exec("using of JavaBeans technology")
// matches JavaBeans

function main(): void {
    let r: RegExp = new RegExp('Java(?!Script)([A-Z]\\w*)');
    let m = r.exec('using of JavaBeans technology');
    arktest.assertTrue(m !== null);
    arktest.assertEQ(m![0], 'JavaBeans');
    arktest.assertEQ(m![1], 'Beans');
    arktest.assertEQ(m!.index, 9);
    arktest.assertEQ(m!.input, 'using of JavaBeans technology');
    arktest.assertEQ(m!.length, 2);
}