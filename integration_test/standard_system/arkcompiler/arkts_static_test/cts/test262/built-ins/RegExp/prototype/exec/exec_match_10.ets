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
// arktsid: exec_match_10
// description: String is 1.01 and RegExp is /1|12/

function main(): void {
    let r = new RegExp('1|12');
    let m = r.exec('1.01');
    arktest.assertEQ(m![0], '1');
    arktest.assertEQ(m!.index, 0);
    arktest.assertEQ(m!.input, '1.01');
}