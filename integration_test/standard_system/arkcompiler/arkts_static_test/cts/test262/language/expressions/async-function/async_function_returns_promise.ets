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

// arktsid: async_function_returns_promise
// description: An async function expression returns a Promise instance

async function anon(): Promise<void> {
    return;
}

function main(): void {
    let p = anon();
    // async functions always return a Promise instance
    arktest.assertTrue(p instanceof Promise);
}
