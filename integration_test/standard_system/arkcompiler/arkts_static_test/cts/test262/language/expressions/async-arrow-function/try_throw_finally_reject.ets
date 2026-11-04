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

// arktsid: try_throw_finally_reject
// description: an async function's promise is deferred until the finally block is evaluated; an awaited rejection in
// finally overrides an earlier throw
// Conversion notes: covers the rule that a rejection awaited in finally overrides a pending try-block throw, settling
// the promise as rejected.

async function f(): Promise<string> {
    try {
        throw new Error('early-throw');
    } finally {
        await new Promise<string>((resolve, reject) => {
            reject(new Error('override'));
        });
    }
}

function main(): void {
    f().then((value: string): void => {
        arktest.assertEQ('resolve-cb', value);
    }, (err: Error): void => {
        arktest.assertEQ('override', err.message);
    });
}