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

// arktsid: await_operator_resolves_promise_value
// description: await yields the value that the awaited promise resolves to
// Conversion notes: an async function awaits a resolved promise and returns its value; the resolved int is surfaced
// through a promise chain.

async function resolveValue(): Promise<int> {
    return await Promise.resolve(42);
}

function main(): void {
    let p: Promise<int> = resolveValue();
    p.then((v: int) => {
        arktest.assertEQ(42, v);
    });
}