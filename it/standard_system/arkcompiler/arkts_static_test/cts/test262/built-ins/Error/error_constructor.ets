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

// arktsid: error_constructor
// description: Error constructor with message string; RangeError, TypeError, URIError subtypes

function main(): void {
    // Error with message
    let e1 = new Error('test message');
    arktest.assertEQ(e1.message, 'test message');

    // Error without message
    let e2 = new Error();
    arktest.assertEQ(e2.message, '');

    // RangeError
    let re = new RangeError('out of range');
    arktest.assertEQ(re instanceof Error, true);
    arktest.assertEQ(re.message, 'out of range');

    // TypeError
    let te = new TypeError('type mismatch');
    arktest.assertEQ(te instanceof Error, true);

    // URIError
    let ue = new URIError('bad uri');
    arktest.assertEQ(ue instanceof Error, true);
}