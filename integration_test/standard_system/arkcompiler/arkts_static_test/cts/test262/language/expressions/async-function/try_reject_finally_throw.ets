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
// arktsid: try_reject_finally_throw
// description: An error thrown in finally overrides an earlier async rejection (async function expression)

async function rejecting(message: string): Promise<void> {
    throw new Error(message);
}

function throwOverride(): void {
    throw new Error('override');
}

async function f(): Promise<void> {
    try {
        await rejecting('early-reject');
    } finally {
        throwOverride();
    }
}

function main(): void {
    f().then((_: void): void => {
        arktest.assertTrue(false);
    }, (error: Error): void => {
        arktest.assertEQ(error.message, 'override');
    });
}
