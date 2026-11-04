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
// arktsid: nameless_async_function_abrupt_default_expression
// description: An abrupt default parameter expression prevents async body evaluation (unnamed async function
// expression)

let callCount: int = 0;

function failing(): int {
    throw new Error('error');
}

async function f(value: int = failing()): Promise<void> {
    callCount += 1;
}

function main(): void {
    f().then((_: void): void => {
        arktest.assertTrue(false);
    }, (_: Error): void => {
        arktest.assertEQ(callCount, 0);
    });
}