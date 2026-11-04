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

// arktsid: try_reject_finally_return
// description: an async function's promise is deferred until the finally block is evaluated; a return in finally
// overrides an earlier rejection
// Conversion notes: covers the rule that a return in finally overrides a pending try-block rejection, settling the
// promise as fulfilled.

async function f(): Promise<string> {
    let result: string = '';
    try {
        await new Promise<string>((resolve, reject) => {
            reject(new Error('early-reject'));
        });
    } catch (e) {
    } finally {
        result = 'override';
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