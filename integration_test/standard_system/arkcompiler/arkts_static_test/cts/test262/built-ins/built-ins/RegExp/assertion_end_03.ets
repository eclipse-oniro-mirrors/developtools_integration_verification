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

// arktsid: assertion_end_03
// description: Execute /s$/m.exec("pairs\nmakes\tdouble") and check results

function main(): void {
    let r: RegExp = new RegExp('s$', 'm');
    let m = r.exec('pairs\nmakes\tdouble');
    arktest.assertEQ(m!.length, 1, '__executed.length');
    arktest.assertEQ(m!.index, 4, '__executed.index');
    arktest.assertEQ(m!.input, 'pairs\nmakes\tdouble', '__executed.input');
    arktest.assertEQ(m![0], 's', '__executed[0]');
}