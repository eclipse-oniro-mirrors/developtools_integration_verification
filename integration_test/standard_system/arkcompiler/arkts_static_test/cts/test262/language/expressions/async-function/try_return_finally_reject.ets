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
// arktsid: try_return_finally_reject
// description: A rejection in finally overrides an earlier async return (async function expression)

async function rejecting(message: string): Promise<void> {
    throw new Error(message);
}

async function f(): Promise<string> {
    try {
        return 'early-return';
    } finally {
        await rejecting('override');
    }
}

function main(): void {
    f().then((_: string): void => {
        arktest.assertTrue(false);
    }, (error: Error): void => {
        arktest.assertEQ(error.message, 'override');
    });
}
