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
// arktsid: quantifier_star_09
// description: Execute /["'][^"']*["']/.exec('alice cries out:""') and check results

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('["\'][^"\']*["\']').exec('alice cries out:""');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'length');
        arktest.assertEQ(executed.index, 16, 'index');
        arktest.assertEQ(executed.input, 'alice cries out:""', 'input');
        arktest.assertEQ(executed[0], '""', 'matched substring');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}