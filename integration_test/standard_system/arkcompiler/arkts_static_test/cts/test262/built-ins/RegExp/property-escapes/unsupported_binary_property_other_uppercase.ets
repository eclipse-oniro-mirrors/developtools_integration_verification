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

// arktsid: unsupported_binary_property_other_uppercase
// description: Other_Uppercase was removed from the Unicode property escapes proposal and must not be supported

function main(): void {
    let caught: boolean = false;
    try {
        let r = new RegExp('\\p{Other_Uppercase}', 'u');
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, '\\p{Other_Uppercase} should throw SyntaxError');
}