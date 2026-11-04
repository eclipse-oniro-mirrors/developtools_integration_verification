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

// arktsid: string_identity
// description: Result of String conversion from string value is the input argument (no conversion)

function main(): void {
    let x1: string = 'abc';
    arktest.assertEQ(String(x1), x1, '#1: String(\'abc\') === \'abc\'');

    let x2: string = 'abc';
    arktest.assertEQ(typeof String(x2), typeof x2, '#2: typeof String(\'abc\') === \'string\'');
}