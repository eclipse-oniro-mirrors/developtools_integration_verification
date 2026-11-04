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
// arktsid: empty_string_repeat_returns_empty
// description: An empty string repeated n times returns an empty string.

function main(): void {
    arktest.assertEQ(''.repeat(1), '');
    arktest.assertEQ(''.repeat(3), '');

    let maxSafe32bitInt: int = 2147483647;
    arktest.assertEQ(''.repeat(maxSafe32bitInt), '');
}