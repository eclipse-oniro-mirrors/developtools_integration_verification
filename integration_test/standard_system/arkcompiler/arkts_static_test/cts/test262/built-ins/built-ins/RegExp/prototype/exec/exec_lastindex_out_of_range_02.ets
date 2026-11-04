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
// arktsid: exec_lastindex_out_of_range_02
// description: Set lastIndex to 100 and call /(?:ab|cd)\d?/g.exec("aacd22 ")

function main(): void {
    let re = new RegExp('(?:ab|cd)\\d?', 'g');
    re.lastIndex = 100;
    let executed = re.exec('aacd22 ');

    arktest.assertEQ(executed, null);
    arktest.assertEQ(re.lastIndex, 0);
}