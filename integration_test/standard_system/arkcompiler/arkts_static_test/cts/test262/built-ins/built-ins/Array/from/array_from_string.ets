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

// arktsid: array_from_string
// description: Testing Array.from when passed a String

function main(): void {
    let result: string[] = Array.from('Test');
    arktest.assertEQ(result.length, 4, 'length');
    arktest.assertEQ(result[0], 'T', 'result[0]');
    arktest.assertEQ(result[1], 'e', 'result[1]');
    arktest.assertEQ(result[2], 's', 'result[2]');
    arktest.assertEQ(result[3], 't', 'result[3]');
}