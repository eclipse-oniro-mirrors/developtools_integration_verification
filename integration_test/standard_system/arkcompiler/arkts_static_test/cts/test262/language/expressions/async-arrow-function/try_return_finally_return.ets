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

// arktsid: try_return_finally_return
// description: an async function's promise is deferred until the finally block is evaluated; a finally return overrides
// an earlier try return
// Conversion notes: covers the rule that finally is evaluated before the async promise settles, and its return value
// wins over a try-block return.

async function f(): Promise<string> {
    let result: string = 'early-return';
    try {
        result = await Promise.resolve('early-return');
    } finally {
        result = await Promise.resolve('override');
    }
    return result;
}

function main(): void {
    f().then((value: string): void => {
        arktest.assertEQ('override', value);
    }, (err: Error): void => {
        arktest.assertEQ('', err.message);
    });
}