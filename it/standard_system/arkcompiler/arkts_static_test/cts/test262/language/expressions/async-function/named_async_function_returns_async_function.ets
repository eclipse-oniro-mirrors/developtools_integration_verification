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
// arktsid: named_async_function_returns_async_function
// description: An async function may return another async function (named async function expression)

async function asyncFn(x: int): Promise<() => Promise<int>> {
    return async (): Promise<int> => x;
}

function main(): void {
    asyncFn(1).then((retFn: () => Promise<int>): void => {
        retFn().then((result: int): void => {
            arktest.assertEQ(result, 1);
        });
    });
}
