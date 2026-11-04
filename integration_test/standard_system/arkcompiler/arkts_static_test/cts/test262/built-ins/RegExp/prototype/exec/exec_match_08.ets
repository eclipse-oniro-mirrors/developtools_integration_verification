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
// arktsid: exec_match_08
// description: String is {toString:void 0, valueOf:function(){throw "invalof";}} and RegExp is /[a-z]/

function main(): void {
    let r = new RegExp('[a-z]');
    // Test exec returns match when pattern matches the string argument
    let m = r.exec('hello');
    arktest.assertEQ(m![0], 'h');
}