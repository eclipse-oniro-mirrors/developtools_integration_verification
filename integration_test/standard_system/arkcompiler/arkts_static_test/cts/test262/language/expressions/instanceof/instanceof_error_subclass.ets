/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: instanceof_error_subclass
// description: an Error subclass instance is an instanceof Error but not a sibling error type
// Conversion notes: In ArkTS the Error subclass must declare its own constructor forwarding to super(msg).

class MyError extends Error {
    constructor(msg: string) {
        super(msg);
    }
}

function main(): void {
    let err = new MyError('failed');
    arktest.assertTrue(err instanceof Error);
    arktest.assertTrue(err instanceof MyError);
    // a plain Error is not a TypeError
    let plain = new Error('y');
    arktest.assertFalse(plain instanceof TypeError);
}
