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
// arktsid: test_match_05
// description: RegExp is /(aa|aabaac|ba|b|c)*/ and tested string is an object whose toString returns {} (non-primitive)
// so ToString falls back to valueOf returning "aabaac"

function main(): void {
    let r = new RegExp('(aa|aabaac|ba|b|c)*', '');
    let s: string = 'aabaac';

    arktest.assertEQ(r.test(s), r.exec(s) !== null);
}