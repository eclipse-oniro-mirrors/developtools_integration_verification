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

// arktsid: nativeerrors_rangeerror_is_constructor
// description: RangeError is a constructor — new RangeError() creates a RangeError instance

function main(): void {
    // RangeError can be constructed with new
    let e: RangeError = new RangeError('test');
    arktest.assertEQ(e.name, 'RangeError', 'new RangeError() creates RangeError with correct name');
    arktest.assertEQ(e.message, 'test', 'new RangeError(\'test\') creates RangeError with correct message');
}