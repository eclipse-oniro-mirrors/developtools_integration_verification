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
// arktsid: try_throw_finally_return
// description: A return in finally overrides an earlier async throw (async function expression)

async function resolving(message: string): Promise<string> {
    return message;
}

async function f(): Promise<string> {
    let result: string = '';
    try {
        throw new Error('early-throw');
    } catch (e) {
    } finally {
        result = await resolving('override');
    }
    return result;
}

function main(): void {
    f().then((value: string): void => {
        arktest.assertEQ(value, 'override');
    }, (_: Error): void => {
        arktest.assertTrue(false);
    });
}
