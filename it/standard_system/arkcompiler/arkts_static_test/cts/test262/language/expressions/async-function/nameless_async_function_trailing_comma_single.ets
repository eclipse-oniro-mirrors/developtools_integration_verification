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
// arktsid: nameless_async_function_trailing_comma_single
// description: A trailing comma is allowed after a single async function parameter (unnamed async function expression)

async function ref(a: int,): Promise<void> {
    arktest.assertEQ(a, 42);
}

function main(): void {
    ref(42);
}
