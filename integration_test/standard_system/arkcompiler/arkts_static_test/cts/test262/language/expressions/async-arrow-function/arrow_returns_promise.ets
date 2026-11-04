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

// arktsid: arrow_returns_promise
// description: an async arrow function returns a Promise that resolves to the awaited result
// Conversion notes: covers the rule that an async arrow function returns a Promise instance, and the awaited expression
// value is delivered through it.

function main(): void {
    let f: () => Promise<int> = async (): Promise<int> => {
        return 1 + 2;
    };
    let p: Promise<int> = f();
    let isP: boolean = p instanceof Promise;
    arktest.assertTrue(isP);
    p.then((v: int): void => {
        arktest.assertEQ(3, v);
    }, (err: Error): void => {
        arktest.assertEQ('', err.message);
    });
}