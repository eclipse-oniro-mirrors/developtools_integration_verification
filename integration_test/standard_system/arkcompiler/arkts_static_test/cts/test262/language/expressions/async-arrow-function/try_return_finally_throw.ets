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

// arktsid: try_return_finally_throw
// description: an async function's promise is deferred until the finally block is evaluated; an exception thrown in
// finally overrides an earlier try return
// Conversion notes: covers the rule that an exception thrown in finally overrides a pending try-block return, settling
// the promise as rejected.

function throwOverride(): void {
    throw new Error('override');
}
async function f(): Promise<string> {
    try {
        return 'early-return';
    } finally {
        throwOverride();
    }
}

function main(): void {
    f().then((value: string): void => {
        arktest.assertEQ('resolve-cb', value);
    }, (err: Error): void => {
        arktest.assertEQ('override', err.message);
    });
}