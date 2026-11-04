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

// arktsid: fromcharcode_modulo
// description: Compute result modulo 2^16 when converting each code argument

function main(): void {
        arktest.assertEQ(String.fromCharCode(-32767).charCodeAt(0), 32769,
        '#1: fromCharCode(-32767).charCodeAt(0) === 32769');
        arktest.assertEQ(String.fromCharCode(-32768).charCodeAt(0), 32768,
        '#2: fromCharCode(-32768).charCodeAt(0) === 32768');
        arktest.assertEQ(String.fromCharCode(-32769).charCodeAt(0), 32767,
        '#3: fromCharCode(-32769).charCodeAt(0) === 32767');
    arktest.assertEQ(String.fromCharCode(-65535).charCodeAt(0), 1, '#4: fromCharCode(-65535).charCodeAt(0) === 1');
    arktest.assertEQ(String.fromCharCode(-65536).charCodeAt(0), 0, '#5: fromCharCode(-65536).charCodeAt(0) === 0');
        arktest.assertEQ(String.fromCharCode(-65537).charCodeAt(0), 65535,
        '#6: fromCharCode(-65537).charCodeAt(0) === 65535');
        arktest.assertEQ(String.fromCharCode(65535).charCodeAt(0), 65535,
        '#7: fromCharCode(65535).charCodeAt(0) === 65535');
    arktest.assertEQ(String.fromCharCode(65536).charCodeAt(0), 0, '#8: fromCharCode(65536).charCodeAt(0) === 0');
    arktest.assertEQ(String.fromCharCode(65537).charCodeAt(0), 1, '#9: fromCharCode(65537).charCodeAt(0) === 1');
        arktest.assertEQ(String.fromCharCode(131071).charCodeAt(0), 65535,
        '#10: fromCharCode(131071).charCodeAt(0) === 65535');
    arktest.assertEQ(String.fromCharCode(131072).charCodeAt(0), 0, '#11: fromCharCode(131072).charCodeAt(0) === 0');
    arktest.assertEQ(String.fromCharCode(131073).charCodeAt(0), 1, '#12: fromCharCode(131073).charCodeAt(0) === 1');
}